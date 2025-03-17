Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30E5A65D8C
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Mar 2025 20:07:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76A4FC78F62;
	Mon, 17 Mar 2025 19:07:05 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3758CFAC47
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 19:07:03 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so3975822276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742238422; x=1742843222;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6RevE+/2qxmOX1OsAOO/NoYDCUJbl++tVOD4TWknW3g=;
 b=dXpUnFG+VcBJ0JXYhJfu7d7x79BG32HnRlitw0bWLITDp+CG7VA6CY6c9krZVm/AhJ
 JJ3Aozt0EI+hWi5Pydzniu/iGnKyZOKuUPXgrGvLpAYlBOEvu5xNv4Js+K9t80/vVvJK
 KIKyVT+CE2HljUH2YEY2tIQZQ+Aq5JW8q0RHoptWyi3TkdEn+K5IjYQb2iMy2iDHaBhS
 sMJmH9dwC1hFemgnitfM0nD8F9FcCrJPkqOsN/LzpQbUlXd7/LnZalWjitpwSLJHH8Ky
 knt6fpeQXFMOPU5JVZbV2WE6KDzmwq10YY98hCjg0Gki3lZM5+OVfWn6VRknvl98Z9zL
 lYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742238422; x=1742843222;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6RevE+/2qxmOX1OsAOO/NoYDCUJbl++tVOD4TWknW3g=;
 b=W7gVryfgha0aGzDjiIngNCCy59Z88ZFeuHqWzMvwx9TRNYmexq/WRj6AqooiUcGKya
 FWQdC2z3/DwWlmjcLz21MtSHta0CrSGuar6K1WccOUJLzrQmDDzO38EaXsKD6ydcRy9B
 u6ARnBaKMDaiCMTXB+btkgZThKllSJWSBJrGT5DH497LrW06f/ZBd07Y8Z92iYNe2DD3
 TqfijZy91EKYtPdSo4wSJ7gt43UVsrG5FPZCXE3I4XLnXcAOul1rfm0BNhDSeRk6q2ms
 VYm+fPMGyZfJMeFl4THD+n+Aumdt9hIDKACIjz7jt7pDEV16VYh3C67kP69tLrqY/P+U
 MKtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeIDnXLz86ah1tmFdqDm8AnxQNtoUbW3Lx2AGeXVowv0Lrik3xuMrw1fZOFpgvsIqrjOL20jyWKm4XdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGrQg48YeB4NBEi/UPdwWWnUiHZtAOp4yOWK9Y9kRa9RgxqAYk
 GC2eapgsuubaKBW1CoiMFlVIMGhRCpAhtvtUZTNXa+tJfQlnFqg1oXpzy2IlP/OWNe4bJI1Sbbx
 qS7zDVLksc3CyoCGvYUnn4I1ftOG7PfVqCEUWYg==
X-Gm-Gg: ASbGncv5JnDoIop4Boe4Fnwr8/g/UBMAA/2ldgghmOepX2Jlyvjcw798ZlvAH9vbJK8
 +ohgua7xzhqEthCN4A/IfCB1VfCAqZxFl91Qbp+eXv9tb3ivxEZxrymMeGXIctNSt/dt8qtm1jt
 nj9v+xQOVXRvVC0FEzCQhDormLofQ=
X-Google-Smtp-Source: AGHT+IHo5HZyjt848wiuxLI0OEj6XSXBPui+ICTN3Q0WxJt5DqBnAeizn1fVgujg9QXdsvTMTmwjqtkPL6Jb6BbB0M0=
X-Received: by 2002:a05:6902:2612:b0:e64:b9c:47b7 with SMTP id
 3f1490d57ef6-e64af1506e9mr1417833276.19.1742238422574; Mon, 17 Mar 2025
 12:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <875xk78wba.fsf@bloch.sibelius.xs4all.nl>
In-Reply-To: <875xk78wba.fsf@bloch.sibelius.xs4all.nl>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 17 Mar 2025 21:06:26 +0200
X-Gm-Features: AQ5f1Jo0kkqDsRovgtxwJj1E3Q7XE_haTrZKUht4pyaht9YS4YYxjLEy8aIzsRw
Message-ID: <CAC_iWjLY6vytm6UB=Fc3kKpMWQ3=nc19eAi+KjjbwHb9Dfw=VQ@mail.gmail.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: peng.fan@nxp.com, vincent.stehle@arm.com, u-boot@lists.denx.de,
 jj251510319013@gmail.com, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.rudolph@9elements.com, trini@konsulko.com, udit.agarwal@nxp.com,
 xypron.glpk@gmx.de, Manish.Tomar@nxp.com, Oliver.Gaskell@analog.com,
 wasim.khan@nxp.com, matt@traverse.com.au, duje.mihanovic@skole.hr,
 tien.fong.chee@altera.com, e@freeshell.de, rayagonda.kokatanur@broadcom.com,
 adrianox@gmail.com, Ashish.Kumar@nxp.com, semen.protsenko@linaro.org,
 sumit.garg@kernel.org, sughosh.ganu@linaro.org, alif.zakuan.yuslaimi@intel.com,
 lukas.funke@weidmueller.com, robert.marko@sartura.hr, michal.simek@amd.com,
 mingkai.hu@nxp.com, raymond.mao@linaro.org, caleb.connolly@linaro.org,
 andy.tang@nxp.com, priyanka.jain@nxp.com, sjg@chromium.org,
 maks.mishinfz@gmail.com, meenakshi.aggarwal@nxp.com,
 patrick.delaunay@foss.st.com
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: remove EFI_BOUNCE_BUFFER
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

Hi Mark,
Thanks for taking a look

On Mon, 17 Mar 2025 at 18:18, Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
>
> > From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > Date: Mon, 17 Mar 2025 15:38:36 +0200
> >
> > The EFI subsystem defines its own bounce buffer for devices that
> > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > which can be reused instead of defining another symbol.
> > The only limitation for EFI is that we don't know how big the file a user
> > chooses to transfer is and as a result we can't depend on allocating the
> > memory from the malloc area, which can prove too small.
> >
> > So allocate an EFI buffer of the correct size and pass it to the DM,
> > which already supports bounce buffering via bounce_buffer_start_extalign()
>
> The existing bounce buffer code servers a completely different purpose
> though.  It exists to make sure that hardware with cache-incoherent
> DMA can safely do the required cache flushes.
>
> This means that:
>
> * SoCs with cache-coherent DMA don't necessarily set BOUNCE_BUFFER.
>   Looks like you added that option to all the SoCs where you remove
>   EFI_LOADER_BOUNCE_BUFFER.

Yes, and that has a side effect I should have probably added to the
commit message. Using the existing bounce buffer will flush caches
even if it's pointless.

>
> * SoCs that (now) set BOUNCE_BUFFER may double bounce if the buffers
>   aren't properly aligned.  I suppose that this won't happen since
>   efi_disk_add_dev() sets medio.io_align to the device block size
>   which is typically larger than the cache line size.

I think it won't happen indeed but for a different reason. The EFI
memory we allocate and pass to bounce_buffer_start_extalign() is
page-aligned.
The DM subsystem will call that function with either
blk_buffer_aligned() which always returns 1 or whatever the device has
defined. The strictest one I found was the virtio one which requires
page alignment.

Allocating memory from EFI is needed, simply because the current
bounce buffer API will use the malloc area, which might not be enough.
Do you think the extra cache flush is a no-go and we should leave the
code as-is?

>
> Still the commit message is somewhat misleading; this code doesn't
> really make us use the DM bounce buffering code.
>
> I also spotted a few bugs in the implementation.  See below.

[...]

> > +++ b/lib/efi_loader/efi_disk.c
> > @@ -105,6 +105,8 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
> >       int blksz;
> >       int blocks;
> >       unsigned long n;
> > +     u64 bb = 0xffffffff;
> > +     void *bb_ptr = buffer;
> >
> >       diskobj = container_of(this, struct efi_disk_obj, ops);
> >       blksz = diskobj->media.block_size;
> > @@ -113,27 +115,35 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
> >       EFI_PRINT("blocks=%x lba=%llx blksz=%x dir=%d\n",
> >                 blocks, lba, blksz, direction);
> >
> > +     if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && (uintptr_t)buffer >= SZ_4G + buffer_size - 1) {
>
> Shouldn't that check be
>
>         if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && (uintptr_t)buffer + buffer_size - 1 >= SZ_4G) {
>
> ?

Yes...
I originally had (uintptr_t)buffer > SZ_4G - buffer_size - 1 and avoid
potential overflows, but then I started to think what happens if
buffer_size is 4GB and completely messed this up ...
I think it's (uintptr_t)buffer + buffer_size + 1 >= SZ_4G though,
because SZ_4G is 0x100000000. Anyway yes, you are right, I'll fix it
in v2, but using subtractions.

>
> > +             if (efi_allocate_pages(EFI_ALLOCATE_MAX_ADDRESS, EFI_BOOT_SERVICES_DATA,
> > +                                    buffer_size >> EFI_PAGE_SHIFT, &bb) != EFI_SUCCESS)
> > +                     return EFI_OUT_OF_RESOURCES;
> > +
> > +             bb_ptr = (void *)(uintptr_t)bb;
> > +     }
> >       /* We only support full block access */
> > -     if (buffer_size & (blksz - 1))
> > +     if (buffer_size & (blksz - 1)) {
> > +             if (buffer != bb_ptr)
> > +                     efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
> >               return EFI_BAD_BUFFER_SIZE;
> > +     }
>
> Any reason why you don't check the buffer_size check before allocating
> the bounce buffer?  That way you don't have to worry about freeing it
> here.

Nop, that code was already there and I  didn't move it. I'll move it around.

>
> You're missing a memcpy() here in the case direction == EFI_DISK_WRITE.

ah thanks

>
> >       if (CONFIG_IS_ENABLED(PARTITIONS) &&
> >           device_get_uclass_id(diskobj->header.dev) == UCLASS_PARTITION) {
> >               if (direction == EFI_DISK_READ)

[...]

> > +                     efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
> >               return EFI_DEVICE_ERROR;
> > +     }
> > +
> > +     if (buffer != bb_ptr) {
> > +             memcpy(buffer, bb_ptr, buffer_size);
>
> This memcpy() is only necessary if direction == EFI_DISK_READ.

Ok

[...]

Thanks
/Ilias
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
