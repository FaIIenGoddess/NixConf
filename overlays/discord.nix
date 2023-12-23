self: super: {
  discord = super.discord.override { 
    withOpenASAR = true;
    withVencord = true; };
}
