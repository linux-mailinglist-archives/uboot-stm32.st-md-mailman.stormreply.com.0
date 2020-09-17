Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731126D06A
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 03:10:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D7AAC3FADF
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 01:10:46 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 606F5C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 01:10:45 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id u126so487522oif.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 18:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/pA37dEi6FwW2HjmF9SwouD7n2y2ckIKsTp/+/5w76U=;
 b=RoamRkjFh2N4btovrK6n4H5ThQjOiLI5ivgSz2GGCIsQAaI3/A2/Gfzt2hrdpTM3XI
 w70z4nIhA41SAK91PNZ0rvVyt1K+NucHGLyno+z/AoWD0pzwVF/IyP1yjGiOGVqZHO2/
 PB054MMizB8mQRqw1vlMPMRQKV5TJH1itumY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/pA37dEi6FwW2HjmF9SwouD7n2y2ckIKsTp/+/5w76U=;
 b=GYkfIiJOzOASx+o77oeU8XAXehbxNXX72KmrUJYrVWSuHI0ra3nWtLyZOXN/lA2Tw/
 2Mr6TmtKBl/aCTGXMpJekgcjchVRTeN73NPYRgzz5Ff7/oQC3VUx4tl3Tbo8LHbsXDhR
 ShADOtt7MZxn8jIsSxDAvL8mZiE1p3vFwtujpnUkzdoSi/pk0uVxU6xynE/MXuHoZRtD
 JvvJPLflGb304XbDUx69Eru8UmC67R1k8r5limFIefLQjlQgCaEn5pXeT+suC2upOmCl
 UBGPaEDg007+R9Zl2mU7UWZxCRZVIZiUopx1f7v3XxLnWDH0G7e0n++/Wz0gu0l02N5V
 NvEw==
X-Gm-Message-State: AOAM530WR2SK7RokUuqBBjdym+FALB+0s6Bv3HJH5FAgICQ1p6biMSHD
 dxnh9k529otfxDK+FRUrYJ3DdnQfJit4KUekkuaMFg==
X-Google-Smtp-Source: ABdhPJxgt33aA6zxMjR27o9Xh+cZvPt/4OZX+YfRHpooR6xrmaWzCsF1jn6eYpN2fPfw/R9VIz7ln/gsWcyGQaj1FWU=
X-Received: by 2002:aca:55c5:: with SMTP id j188mr4927376oib.138.1600305043678; 
 Wed, 16 Sep 2020 18:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200910161817.27535-1-patrick.delaunay@st.com>
 <20200910161817.27535-2-patrick.delaunay@st.com>
In-Reply-To: <20200910161817.27535-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 16 Sep 2020 19:09:44 -0600
Message-ID: <CAPnjgZ2YbOT_RVT4aR-g+TyocjGmVJ6R7epzPi4gOzxfG7n4wQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] power: regulator: gpio-regulator:
 Convert to use APIs which support live DT
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

On Thu, 10 Sep 2020 at 10:18, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/power/regulator/gpio-regulator.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
