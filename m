Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6E3CA130
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Jul 2021 17:12:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6B18C58D7F;
	Thu, 15 Jul 2021 15:12:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAA1FC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 15:12:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id w13so3941276wmc.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFIFoeRIITKGVPJkW72kKY4S1VAdiXsQySp3z2wL6Bw=;
 b=i8PvjNspXvbxgkkHZvA6fgtjWW9KxbdGvfvFxUdxlAFSuD9FEGHqE+WMU0l52qj2Ot
 N3EKGJIVzEvxy05y6erv4CpsbJ96ZleIA6sHsxmPsYA7gRv2qQBd++FHAbmGGJVoGzOH
 FUPL0v8/q+vVbSTb9orbElU4z0BiBvOze2yyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFIFoeRIITKGVPJkW72kKY4S1VAdiXsQySp3z2wL6Bw=;
 b=NWSks4zBYeFjFy0GXjC/nnPvFH6Pwcq8/bX2ZY6/RwPtltj/I03ibjjjxLb2ul3kFR
 xrAHaC0wmv6E0+/0refTmh7g+BMkgIfVN4PURKYLUBF1ZIlvv+M5KYrDRSmFwixa4tAl
 e44O4bEH2HRVpUwPQ8bMWVK1oJddRHpKoTfNqvpNID7lLBUBiqFmGmyJm53FTkGhYnJF
 Yl+TFcvO8+K8ideWOi+cNZWAnAcFfVuTKN7Nbl6iG/g2p/w/juX/dSCWrfLlrXODp1EZ
 jptUwUHEjJUHw0td63hMUHKHYIc3ZObyjT94O6ryTnoucnkNFdE1RdzTL45+m2DZRbXO
 ZK0g==
X-Gm-Message-State: AOAM5317ClgcjfNB2U9AMRjhmz7cqxpgVPh+5kxDiHA0F/rISMqvPdF3
 mX6fHADx8mUx5C9wOQcyn55Fe6y/e2TcGeWcrySMHw==
X-Google-Smtp-Source: ABdhPJwHMgvY5nTy/z5Ki465KUBUZJdtcakxaHjXEB7Wlf2tJzPJXiqXzn8YREmgnJEoAO9JA/7f2Dn47yV0klQtd4c=
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr5146267wml.74.1626361937074;
 Thu, 15 Jul 2021 08:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
 <CAPnjgZ3XX_Z9kyFcerS9_GvjzkKzHmdfWOjAtC16k7NN=ReR_g@mail.gmail.com>
 <8a64c1ae-5225-0193-3242-c40b86bc1606@foss.st.com>
In-Reply-To: <8a64c1ae-5225-0193-3242-c40b86bc1606@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 15 Jul 2021 09:12:05 -0600
Message-ID: <CAPnjgZ324dDvyOK=G4rY1FymG=CHVO4-PaJEcPvgUmpQAtAaVQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] stm32mp1: handle TF-A boot with FIP
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

Hi Patrick,

On Thu, 15 Jul 2021 at 07:50, Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Simon
>
> On 7/11/21 2:01 AM, Simon Glass wrote:
> > Hi Patrick,
> >
> > On Thu, 8 Jul 2021 at 03:17, Patrick Delaunay
> > <patrick.delaunay@foss.st.com> wrote:
> >>
> >> In next TF-A version the stm32mp1 platform will support the Firmware
> >> Image Package (FIP) [1], a container filled with:
> >> - the U-Boot binary = u-boot-nodtb.bin
> >> - the U-Boot device tree = u-boot.dtb
> >> - the Secure OS (OP-TEE) or the secure monitor (SP_MIN)
> > That sounds like a job for FIT?
>
>
> Yes it is the same purpose but at TF-A BL2 level, so before U-Boot
> execution.
>
>
> In the STM32MP boot chain with TF-A, we have:
>
> 1/ Rom code load TF-A BL2 in embedded RAM
>
>        => it running in secure world, initializing the DDR
>
> 2/ TF-A BL2 load the next SW component from FIP containers in DDR
>
>      a) secure world, OP-TEE for example, including key infrastructure.
>
>      b) normal world = OS loader : U-Boot + device tree
>
>
> But SPL is not used....
>
>
> TF-A BL2 can be see as SPL a remplacant and
>
> a FIP loaded by TF-A BL2 is equivalent to FIT loaded by SPL,
>
> it the container supported by trusted firmware
>
>
> But even in this use case FIT can be use to load kernel by U-Boot...
>
>
> It was a long debate on the preferred first stage bootloader
>
> for STMicroelectronics ARMv7 platform, between TF-A BL2 and SPL .
>
>
> Today the preferred solution is TF-A BL2 with FIP, for secure boot
>
> support and long term integration with  OP-TEE, even is we lost
>
> the falcon mode.

OK, thanks for the info...

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
