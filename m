Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410427330
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 02:18:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33FA5CC10A7
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 00:18:38 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2D73CC10A5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 00:18:36 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t187so3029010oie.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 17:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6UabnJeho5vvBYv3irjumLImRO0ge+XDl7ddSEQ4To=;
 b=LXotXI3rc8XK2tQjBgquIh53nFCLWO9WL+OOkSNfWIefH6Ow+9OR25uiy6JafBOENJ
 O6HmW0rsUNJjGiqJD0bglq7eu8LVylocM+UmZrGsVJKO8FaaJwfk7Whv/YUiQCe9zKTn
 ZO1x5YWAGzXQA1fNGBH+DUCzaaKKNUj4p3zz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6UabnJeho5vvBYv3irjumLImRO0ge+XDl7ddSEQ4To=;
 b=ZAyTjTGr4oKhmLkC3jyRigTOT7MbXQXXSYpYW/qAz3hIElm7tBD0a8lzThxbVgHiIg
 RMaoAo7tHXJL/3ivxWEXo71Tpw3b5teu5MZ80O72GKMWdhVEfREc3yUq/u6UFvTxfa1k
 0A78vj6tECd/TC5FWAlQXqoJ5ybxM1+F8N+ATI7uO9EJmsFysdt4DOBXruDLDMPgPmU0
 CjWpFrtcApRK5vXSTtyDIEiCPRLkg4JltrYjSpBnRppsd+/tsk7M1vKmyG73ghxiO5XC
 855P5AVQebQc88Ex8UOfULLF7zPdADCsGKppK/fOSS6h0hIoH74K6uF3fyNp8akwuXOO
 VAHw==
X-Gm-Message-State: APjAAAVu90DeOIJ9HWajgEzyAIREE8I0BJvPISOfzE/1usbzFW7y4IX9
 tB1r7+psVmd8ezg6Ad7GNhPSeRlhO+B11UBsqKijWA==
X-Google-Smtp-Source: APXvYqwcTwFh6T/891SlZtu666Iqc0+LSK7EVt41ey412t7ydSXAbC5+r7ckFMlsrVi2lM/G+TAuCQct8IdJTogs4Ps=
X-Received: by 2002:aca:f20a:: with SMTP id q10mr912913oih.94.1558570714785;
 Wed, 22 May 2019 17:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
 <1558512409-32376-5-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1558512409-32376-5-git-send-email-fabien.dessenne@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 22 May 2019 18:18:23 -0600
Message-ID: <CAPnjgZ0Kk-83VSCW_ht2oVGWacdtu9iBUoyFiTE3r+gJEa1rNQ@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 4/7] remoteproc: add elf file load support
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Fabien,

On Wed, 22 May 2019 at 02:07, Fabien Dessenne <fabien.dessenne@st.com> wrote:
>
> The current implementation supports only binary file load.
> Add helpers to support ELF format (check validity, sanity check, and
> load).
> Note that since an ELF image is built for the remote processor, the load
> function uses the da_to_pa ops to translate the addresses.
>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/remoteproc/rproc-uclass.c | 128 ++++++++++++++++++++++++++++++++++++++
>  include/remoteproc.h              |  29 ++++++++-
>  2 files changed, 156 insertions(+), 1 deletion(-)

It doesn't look like we can easily make use of the existing ELF loader.

But please add a test for this in test/dm/remoteproc.c and see below.



>
> diff --git a/drivers/remoteproc/rproc-uclass.c b/drivers/remoteproc/rproc-uclass.c
> index c8a41a6..ac5f9e2 100644
> --- a/drivers/remoteproc/rproc-uclass.c
> +++ b/drivers/remoteproc/rproc-uclass.c
> @@ -5,6 +5,7 @@
>   */
>  #define pr_fmt(fmt) "%s: " fmt, __func__
>  #include <common.h>
> +#include <elf.h>
>  #include <errno.h>
>  #include <fdtdec.h>
>  #include <malloc.h>
> @@ -291,6 +292,133 @@ int rproc_dev_init(int id)
>         return ret;
>  }
>
> +/*
> + * Determine if a valid ELF image exists at the given memory location.
> + * First look at the ELF header magic field, then make sure that it is
> + * executable.
> + */
> +bool rproc_elf_is_valid(unsigned long addr, int size)
> +{
> +       Elf32_Ehdr *ehdr; /* Elf header structure pointer */
> +
> +       ehdr = (Elf32_Ehdr *)addr;
> +
> +       if (!IS_ELF(*ehdr) || size <= sizeof(Elf32_Ehdr)) {
> +               pr_err("No elf image at address 0x%08lx\n", addr);
> +               return false;
> +       }
> +
> +       if (ehdr->e_type != ET_EXEC) {
> +               pr_err("Not a 32-bit elf image at address 0x%08lx\n", addr);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
> +/* Basic function to verify ELF image format */
> +int rproc_elf_sanity_check(ulong addr, ulong size)
> +{
> +       Elf32_Ehdr *ehdr;
> +       char class;
> +
> +       if (!addr) {
> +               pr_err("Invalid fw address?\n");
> +               return -EINVAL;

EFAULT ?

> +       }
> +
> +       if (size < sizeof(Elf32_Ehdr)) {
> +               pr_err("Image is too small\n");
> +               return -EINVAL;

ENOSPC?

> +       }
> +
> +       ehdr = (Elf32_Ehdr *)addr;
> +
> +       /* We only support ELF32 at this point */
> +       class = ehdr->e_ident[EI_CLASS];
> +       if (class != ELFCLASS32) {
> +               pr_err("Unsupported class: %d\n", class);
> +               return -EINVAL;

EPROTONOSUPP?

> +       }
> +
> +       /* We assume the firmware has the same endianness as the host */
> +# ifdef __LITTLE_ENDIAN
> +       if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
> +# else /* BIG ENDIAN */
> +       if (ehdr->e_ident[EI_DATA] != ELFDATA2MSB) {
> +# endif
> +               pr_err("Unsupported firmware endianness\n");
> +               return -EINVAL;
> +       }
> +
> +       if (size < ehdr->e_shoff + sizeof(Elf32_Shdr)) {
> +               pr_err("Image is too small\n");
> +               return -EINVAL;

ESPC

> +       }
> +
> +       if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> +               pr_err("Image is corrupted (bad magic)\n");
> +               return -EINVAL;

EBADF

> +       }
> +
> +       if (ehdr->e_phnum == 0) {
> +               pr_err("No loadable segments\n");
> +               return -EINVAL;
> +       }
> +
> +       if (ehdr->e_phoff > size) {
> +               pr_err("Firmware size is too small\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +

They are just suggestions, but please try to return useful numbers. In
general it should be possible to see what went wrong without needing
to output text.

> +/* A very simple elf loader, assumes the image is valid */
> +int rproc_elf_load_image(struct udevice *dev, unsigned long addr)
> +{
> +       Elf32_Ehdr *ehdr; /* Elf header structure pointer */
> +       Elf32_Phdr *phdr; /* Program header structure pointer */
> +       const struct dm_rproc_ops *ops;
> +       unsigned int i;
> +
> +       ehdr = (Elf32_Ehdr *)addr;
> +       phdr = (Elf32_Phdr *)(addr + ehdr->e_phoff);
> +
> +       ops = rproc_get_ops(dev);
> +       if (!ops) {
> +               dev_dbg(dev, "Driver has no ops?\n");
> +               return -EINVAL;
> +       }

This is not allowed, so you don't need to check for it.

> +
> +       /* Load each program header */
> +       for (i = 0; i < ehdr->e_phnum; ++i) {
> +               void *dst = (void *)(uintptr_t)phdr->p_paddr;
> +               void *src = (void *)addr + phdr->p_offset;
> +
> +               if (phdr->p_type != PT_LOAD)
> +                       continue;
> +
> +               if (ops->da_to_pa)
> +                       dst = (void *)ops->da_to_pa(dev, (ulong)dst);
> +
> +               dev_dbg(dev, "Loading phdr %i to 0x%p (%i bytes)\n",
> +                       i, dst, phdr->p_filesz);
> +               if (phdr->p_filesz)
> +                       memcpy(dst, src, phdr->p_filesz);
> +               if (phdr->p_filesz != phdr->p_memsz)
> +                       memset(dst + phdr->p_filesz, 0x00,
> +                              phdr->p_memsz - phdr->p_filesz);
> +               flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
> +                           roundup((unsigned long)dst + phdr->p_filesz,
> +                                   ARCH_DMA_MINALIGN) -
> +                           rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
> +               ++phdr;
> +       }
> +
> +       return 0;
> +}
> +
>  int rproc_load(int id, ulong addr, ulong size)
>  {
>         struct udevice *dev = NULL;
> diff --git a/include/remoteproc.h b/include/remoteproc.h
> index 58df11a..5cc04e6 100644
> --- a/include/remoteproc.h
> +++ b/include/remoteproc.h
> @@ -104,7 +104,7 @@ int rproc_dev_init(int id);
>  bool rproc_is_initialized(void);
>
>  /**
> - * rproc_load() - load binary to a remote processor
> + * rproc_load() - load binary or elf to a remote processor
>   * @id:                id of the remote processor
>   * @addr:      address in memory where the binary image is located
>   * @size:      size of the binary image
> @@ -159,6 +159,27 @@ int rproc_ping(int id);
>   * Return: 0 if all ok, else appropriate error value.

What does ok mean? Running?

>   */
>  int rproc_is_running(int id);
> +
> +/**
> + * rproc_elf_is_valid() - check if an image is a valid ELF one

In what sense?

> + * @addr:      image address

Is this address in the remote space?

In general your comments are a bit brief

> + * @size:      image size

@return - also please use an int return (e.g. 0 is valid and -ve error
means not). You could rename to rproc_elf_check_valid()

> + */
> +bool rproc_elf_is_valid(unsigned long addr, int size);
> +
> +/**
> + * rproc_elf_sanity_check() - verify an ELF image format

What is different about this from the above functions?

> + * @addr:      ELF image address
> + * @size:      ELF image size
> + */
> +int rproc_elf_sanity_check(ulong addr, ulong size);
> +
> +/**
> + * rproc_elf_load_image() - load an ELF image
> + * @dev:       device loading the ELF image
> + * @addr:      valid ELF image address

@return
> + */
> +int rproc_elf_load_image(struct udevice *dev, unsigned long addr);
>  #else
>  static inline int rproc_init(void) { return -ENOSYS; }
>  static inline int rproc_dev_init(int id) { return -ENOSYS; }
> @@ -169,6 +190,12 @@ static inline int rproc_stop(int id) { return -ENOSYS; }
>  static inline int rproc_reset(int id) { return -ENOSYS; }
>  static inline int rproc_ping(int id) { return -ENOSYS; }
>  static inline int rproc_is_running(int id) { return -ENOSYS; }
> +static inline bool rproc_elf_is_valid(unsigned long addr,
> +                                     int size) { return -ENOSYS; }
> +static inline int rproc_elf_sanity_check(ulong addr,
> +                                        ulong size) { return -ENOSYS; }
> +static inline int rproc_elf_load_image(struct udevice *dev,
> +                                      unsigned long addr)  { return -ENOSYS; }
>  #endif
>
>  #endif /* _RPROC_H_ */
> --
> 2.7.4
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
