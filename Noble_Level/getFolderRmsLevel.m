function [DbArray, varargout] = getFolderRmsLevel(FileDir, FileExt)

    %   Calculate level for all files in folder.

    Filenames = dir(FileDir + "*." + FileExt);

    NumFiles = length(Filenames);

    RmsArray = zeros(NumFiles, 1);

    for f = 1:NumFiles
        File = Filenames(f).name;

        x = audioread(File);
        Rms_ = mean(rms(x));

        %   Store in array.
        RmsArray(f) = Rms_;
    end

    [MaxRms, MaxIndex] = max(RmsArray);
    [MinRms, MinIndex] = min(RmsArray);
    AveRms = mean(RmsArray, 1);

    MinDb = 20*log10(MinRms/MaxRms);
    AveDb = 20*log10(AveRms/MaxRms);

    DbArray = 20*log10(RmsArray/MaxRms);

    fprintf("Highest RMS from file: \t%s\n", Filenames(MaxIndex).name);
    fprintf("Lowest RMS from file: \t%s\n", Filenames(MinIndex).name);
    fprintf("Minimum: \t\t%f dB\n", MinDb);
    fprintf("Average: \t\t%f dB\n", AveDb);
    
    varargout{1} = MinDb;
    varargout{2} = AveDb;