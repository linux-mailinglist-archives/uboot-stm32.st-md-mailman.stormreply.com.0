Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F502E94D7
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:49:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 523DCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:49:59 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08700C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:49:58 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id u13so746388ote.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsVBc31Qttq6ZJN2nhylzirKHzSCxYlgOurcIiLwrXY=;
 b=n3kw3V76TGro9I/77RP2pDse336vuFSnjL+euebfYcPOOoSOQ0kFAZcCt4NW7KZrJp
 wauicftnrv/vloECMcixYMrC8d/CQTyOffrH72Gn4Tiag/FM+227o9vemWcOjn/wi2KF
 1jmB7Ps+V61VCESkHYdooRlix6w+ZDE1W64bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsVBc31Qttq6ZJN2nhylzirKHzSCxYlgOurcIiLwrXY=;
 b=c1qFrcbfCmVXy65laNAZtK2izu2jGOzfKz4RphBicc3ondJGCfh32cWwCcnZ4szfx0
 X3VeFEaFAmllUrlo+d2/bS4lzosfg+ZoDkDoordjGksjV3ufBBa9jJj9uTIOzR/V21rr
 /aVXgN9D9pFzk8jXLZvFq7xng95R9aMcuboVjiH3glJl3zx8/XwgPY41ANlXl/TTL241
 1JrVQb1z0c2IBEtXlhDmC9N4Gp22EHO/ZGwmSx71QZMd0prJxNUbrvVhu5knPJAXDT1j
 s7okdE+3RGNr6K7KoMg1OiqofEUyNy3tgNpubAPTzlqHi3ufZGh55l5Nj71i1N3WAKGF
 quUA==
X-Gm-Message-State: APjAAAWlV1J+3HOmsY/q0elB62eah431yq/Y+ciVe4kU8YkxIxCIWXNN
 /zL9U8N588snEGMKxt76Uu9U4cQBpua9Qt6sud+dVw==
X-Google-Smtp-Source: APXvYqzIHL876psKbRBfq2C81sbE3irEg+qmJ6gFyfIG55hRzsWRy0xtd3KvLZPYMd8rg7P0qbNalNThPtz1+oF+PWk=
X-Received: by 2002:a05:6830:1d8a:: with SMTP id
 y10mr18087596oti.48.1572400196322; 
 Tue, 29 Oct 2019 18:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-2-git-send-email-fabien.dessenne@st.com>
 <CAPnjgZ33+J-10WgcmFBjGuqJ90caJFj7mGy+vApbxAyymCXvZw@mail.gmail.com>
 <9a098f3c-250c-d589-70d3-6dcfe0fbdc93@st.com>
In-Reply-To: <9a098f3c-250c-d589-70d3-6dcfe0fbdc93@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:49:44 -0600
Message-ID: <CAPnjgZ3mf-edo-_kWRqz4o4mh34rOzw76sxo6bPE6yJ3XuJEvQ@mail.gmail.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] remoteproc: elf_loader: Add elf
	resource table load support
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

On Tue, 22 Oct 2019 at 03:08, Fabien DESSENNE <fabien.dessenne@st.com> wrote:
>
> Hi Simon,
>
>
> On 22/10/2019 1:47 AM, Simon Glass wrote:
> > Hi Fabien,
> >
> > On Wed, 9 Oct 2019 at 09:36, Fabien Dessenne <fabien.dessenne@st.com> wrote:
> >> Add rproc_elf_load_rsc_table(), which searches for a resource table in
> >> an elf64/elf32 image, and if found, copies it to device memory.
> >> Add also the elf32 and elf64 variants of this API.
> >> Add a test for this.
> >>
> >> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >> ---
> >>   drivers/remoteproc/rproc-elf-loader.c | 269 ++++++++++++++++++++++++++++++++++
> >>   include/remoteproc.h                  |  70 +++++++++
> >>   test/dm/remoteproc.c                  |  91 ++++++++++--
> >>   3 files changed, 419 insertions(+), 11 deletions(-)
> >>
> > If you are putting stuff in the image, should you use binman to build
> > the image, then find the contents using the binman tables?
>
>
> The "resource table" may be located anywhere, there is no strict rule
> defining where it is expected to be.
>
> Nevertheless the Linux remoteproc[1] and OpenAmp (running RTOS) [2]
> frameworks expect the resource table to be stored in a dedicated ELF
> section. Both of them run some ELF scanning to find out this section.
>
> The proposed patch is for the "ELF section" variant of the resource table.
> Other variants like binman packing may be proposed as well, both
> implementations can coexist alongside.

So why not use binman to pack the image and find the components? This
is U-Boot, after all.


>
> BR
>
> Fabien
>
> [1] https://www.kernel.org/doc/Documentation/remoteproc.txt
> [2]
> https://github.com/OpenAMP/open-amp/blob/master/lib/remoteproc/elf_loader.c
>
> >
> > Scanning the image for a table seems a bit horrible.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
