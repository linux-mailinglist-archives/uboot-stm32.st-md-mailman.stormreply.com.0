Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D43C27A74
	for <lists+uboot-stm32@lfdr.de>; Sat, 01 Nov 2025 10:04:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 718E0C60465;
	Sat,  1 Nov 2025 09:04:14 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95789C60461
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Nov 2025 09:04:12 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b50206773adso747846366b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Nov 2025 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761987852; x=1762592652;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RqisBkHJ2je7rX7G4nHYoJ/GwbZacV4LJuUVB3qY7CQ=;
 b=JBzVC15bHYREjkRqOhrAc1UnTBYCTjP/DLD3XR5YiCZvkiTdsFQCJlrxhZrk5tGqKU
 QOT429aLlTyfA32CLzs6Ic/3RhRc8FnrfTu4Ro8sFlyijnY9VEk0tR3ZuzQKTHT5yZ9p
 IUc9WSoEhPEMzihCAE21TTcVRhPHOpNZ7ZTM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761987852; x=1762592652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RqisBkHJ2je7rX7G4nHYoJ/GwbZacV4LJuUVB3qY7CQ=;
 b=JSnWD1QPPmJzqDvoStNMd129Ly5O/Pi5iiP18mDCelH75mc8YwHmNMlPMDdX2Mfv2i
 1etBthvBAPpA/qXSzD3CCujzMbYxmPfGxcKDhqHgb3BOP8pVyvNjnXFLJHveYsACxMuL
 RPdbQzDN11lS3y78K7GCnuzgDV4YwyuAHjmVnHHIiwnCEpGdvAeuwfDune+G7TNdpFjh
 pgpqPh0U5d0o4N7BhQpbE7MIGRcbPR95Yqq+HXnRMuaN5F3g1UVFmw66PKtzkeYAiL+e
 2Y258Qb6eM2fmWYx3c/ZkpEpDqqk+fZ/v05ZHl4ls1azEbZgY2OqHtx1E3x8ZTrN5n4L
 Gz6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEsOhFP8IG1unC1kSJrtQW7wZIjWjXxjgSN8cRFUFEqypf5lwZ7oi5JGUpITALNiAjDjrNu9weDVnAFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyY0pI2SLKNHEw5kpWNw8/k2yYkLj+Ttdmt/TK1ay6rL6GyCJBs
 KsU6kSiJyOhSzp/3PCe8m2shSLeh1jfBqBikGWC2sQleoFc5HLo6t87CTLUqivCKA3YMf7MBQNv
 xugACBaoSZl9F3nvURFp8VAtCH6eijJvbSFhnBAfl
X-Gm-Gg: ASbGncu82ByMTQAwOFYBasLm/rX+1v3+6U+63RwZtEOJY22YeMaTJw9tCmdaaTFm3r3
 qHHaZxFjPSKp4cAbPVPBIq/FB4Y4rjhG59n9UWGh+3fpiLLeXjKpp8i6QuGIQLTovk3m9xPH6+L
 okzZj5dkZYkR7XUrgnn/+g/zDMQQpabntBRWMbZWh5LbBIAcNVfPnOWi034X9ryhyEPSI4vUl3l
 Jpx1EwoZtCyzVzq1SBTy8uxvpKId3BDKLhr6P1DcSFfRZGDeB77djWaZlD7RCwPx0439Mw=
X-Google-Smtp-Source: AGHT+IFwOIO6aOgy7fswsGuvWjzeJES+dMPTreoYl8gxqFStPlCBHvnlQk7V3v590T2H+sIVGwbc8XMgto5eMLDNzE0=
X-Received: by 2002:a17:907:6ea6:b0:b6d:6026:9f1d with SMTP id
 a640c23a62f3a-b7051f27e9emr1036713166b.1.1761987851852; Sat, 01 Nov 2025
 02:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
In-Reply-To: <20250904-master-v3-1-b42847884974@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 1 Nov 2025 10:03:59 +0100
X-Gm-Features: AWmQ_bk-kd3YffpUBHGdTcqb2J8FUlXC2bINTQamEUoJy-kpddgT3ym8YhzoRLA
Message-ID: <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
	ofnode_decode_display_timing
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

Hi Raphael,

On Thu, 4 Sept 2025 at 14:53, Raphael Gallais-Pou
<raphael.gallais-pou@foss.st.com> wrote:
>
> The "Display Timings" in panel-common.yaml can be provided by 2 properties
> - panel-timing: when display panels are restricted to a single resolution
>                 the "panel-timing" node expresses the required timings.
> - display-timings: several resolutions with different timings are supported
>                    with several timing subnode of "display-timings" node
>
> This patch update the parsing function to handle this 2 possibility
> when index = 0.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/core/ofnode.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
> index e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd437739776362c2d22a3c9 100644
> --- a/drivers/core/ofnode.c
> +++ b/drivers/core/ofnode.c
> @@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode parent, int index,
>         int ret = 0;
>
>         timings = ofnode_find_subnode(parent, "display-timings");
> -       if (!ofnode_valid(timings))
> -               return -EINVAL;
> -
> -       i = 0;
> -       ofnode_for_each_subnode(node, timings) {
> -               if (i++ == index)
> -                       break;
> +       if (ofnode_valid(timings)) {
> +               i = 0;
> +               ofnode_for_each_subnode(node, timings) {
> +                       if (i++ == index)
> +                               break;
> +               }
> +       } else {
> +               if (index != 0)
> +                       return -EINVAL;
> +               node = ofnode_find_subnode(parent, "panel-timing");
>         }
>
>         if (!ofnode_valid(node))
>
> --
> 2.25.1
>

Please add a test for this in test/dm/ofnode.c

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
