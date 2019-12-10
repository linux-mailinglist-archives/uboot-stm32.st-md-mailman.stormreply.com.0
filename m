Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB5118C59
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 16:18:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E84DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 15:18:23 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AE5BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 15:18:22 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a67so10111458oib.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 07:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2s+HzxtxxhGUlWXz+PnhEKMkjWWi4RbmseTgRiLkmkY=;
 b=ADgqqKYwQviAo3YrNZkaouvA7PyGhbQNh5zv2gSUsyyDQpksojciM7pRByM+2ZYamc
 76d3Vb4lbljoeRWFJZ0zP1KqI6g88hzCRnpwTHDUZ5UVxqsvHscGMOcixGSkfWWD80Gl
 yGNYojoPLToeBGioH6nluPEZmBBExE7WKknBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2s+HzxtxxhGUlWXz+PnhEKMkjWWi4RbmseTgRiLkmkY=;
 b=jxBTg+7GZYzkvJNscIjFEj2V1GmrcFWEIMQRYZqqwXVLvJ6ikx2Su0+4fzXBtHBUru
 CjiP3DVbd9QqPNl+8YMXK7QNIIxyI6FGnJgbfAppBmfnpo/j5OTJ8JlZB/PXt8Bq5oAk
 lkpSbTVUO0Fn3/htvt8e90+vxCZ2waTbgOQCRoIP7Uj9QlYbrfWksGEPfMuQhAueNdZc
 Hjs9KkHrK8D1bN2c8irCEb4ihhTG7WHvnZi28I2MgHrKHakm3ws1PfT09no0DmFynfbt
 z/eaLGepg4WAnmQsLh4e5Ue3VpPrripXPSeiqGKbAIifXvT2pPtN13yzuL0OGuuhf6Tq
 9A6w==
X-Gm-Message-State: APjAAAWZXGBNM2VBPwV3z13S3R6QW46NM1Hj3fZcWr8aUGZiK6F8ZYo+
 +YYp+w3xTEuweeJXxiEvf+p0ZSUaJaRTTddDyvHouA==
X-Google-Smtp-Source: APXvYqyImN6uUSXoqJXiaq3DXtf8647massY7zP1+1yCMdY1MjF5mxkd3g+mjFpaKfxy1KD/orqzBKmA0tTTF6wGgLI=
X-Received: by 2002:aca:3a41:: with SMTP id h62mr4475479oia.97.1575991100175; 
 Tue, 10 Dec 2019 07:18:20 -0800 (PST)
MIME-Version: 1.0
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-2-git-send-email-fabien.dessenne@st.com>
 <CAPnjgZ33+J-10WgcmFBjGuqJ90caJFj7mGy+vApbxAyymCXvZw@mail.gmail.com>
 <9a098f3c-250c-d589-70d3-6dcfe0fbdc93@st.com>
 <CAPnjgZ3mf-edo-_kWRqz4o4mh34rOzw76sxo6bPE6yJ3XuJEvQ@mail.gmail.com>
 <7843e136-32cf-bdf0-d27c-db85651c4f9d@st.com>
In-Reply-To: <7843e136-32cf-bdf0-d27c-db85651c4f9d@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 10 Dec 2019 08:18:15 -0700
Message-ID: <CAPnjgZ36zJWaqgbnEWUN4gK3DC5ppaK+YA3gMKmu+WmK8aK64g@mail.gmail.com>
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

On Wed, 30 Oct 2019 at 03:50, Fabien DESSENNE <fabien.dessenne@st.com> wrote:
>
> Hi Simon
>
> On 30/10/2019 2:49 AM, Simon Glass wrote:
> > Hi Fabien,
> >
> > On Tue, 22 Oct 2019 at 03:08, Fabien DESSENNE <fabien.dessenne@st.com> wrote:
> >> Hi Simon,
> >>
> >>
> >> On 22/10/2019 1:47 AM, Simon Glass wrote:
> >>> Hi Fabien,
> >>>
> >>> On Wed, 9 Oct 2019 at 09:36, Fabien Dessenne <fabien.dessenne@st.com> wrote:
> >>>> Add rproc_elf_load_rsc_table(), which searches for a resource table in
> >>>> an elf64/elf32 image, and if found, copies it to device memory.
> >>>> Add also the elf32 and elf64 variants of this API.
> >>>> Add a test for this.
> >>>>
> >>>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >>>> ---
> >>>>    drivers/remoteproc/rproc-elf-loader.c | 269 ++++++++++++++++++++++++++++++++++
> >>>>    include/remoteproc.h                  |  70 +++++++++
> >>>>    test/dm/remoteproc.c                  |  91 ++++++++++--
> >>>>    3 files changed, 419 insertions(+), 11 deletions(-)
> >>>>
> >>> If you are putting stuff in the image, should you use binman to build
> >>> the image, then find the contents using the binman tables?
> >>
> >> The "resource table" may be located anywhere, there is no strict rule
> >> defining where it is expected to be.
> >>
> >> Nevertheless the Linux remoteproc[1] and OpenAmp (running RTOS) [2]
> >> frameworks expect the resource table to be stored in a dedicated ELF
> >> section. Both of them run some ELF scanning to find out this section.
> >>
> >> The proposed patch is for the "ELF section" variant of the resource table.
> >> Other variants like binman packing may be proposed as well, both
> >> implementations can coexist alongside.
> > So why not use binman to pack the image and find the components? This
> > is U-Boot, after all.
> >
>
> Packing the firmware together with the other U-Boot components is
> acceptable if the firmware is controlled only by U-Boot.
> My requirement is that the coprocessor firmware shall be loaded by
> U-Boot or by Linux.
>
> You can have a look at [1] for more details on the way this is handled
> on STM32 MPU. In that case, the .elf firmware is stored in a in File
> System that can be read by both U-Boot and Linux.
>

Where is the coprocessor firmware stored, then?

> If we have the firmware packed in the image (for U-Boot), we need to
> have a copy in the FileSystem (for Linux) which would not be a good idea.

What type of filesystem do you use? I don't see any filesystem access
in this patch though.

>
> BR
> Fabien
>
> [1] https://wiki.st.com/stm32mpu/index.php/Boot_chains_overview

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
