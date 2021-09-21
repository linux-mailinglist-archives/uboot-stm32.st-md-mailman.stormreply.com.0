Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20D412A2D
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 03:11:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4771C5A4CF;
	Tue, 21 Sep 2021 01:11:42 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE7ECC5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 01:11:41 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id t186so7388844vkd.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 18:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J8u43aBEWBl8AhYSgDveusMZHl+Co4nQDmig9SaAJww=;
 b=SIUxXdKBD7znAp4jGBfxMkYxCXQ931jBv99nUkMfXAbPnfHJEs/l7RWGm+dBUCIE7l
 qEyOvIoq03EDM/oHrgeskyyONSef4mV8uXI46POtQ4jZGgLZU07e/a5M7awwn9w6ldSh
 Uz93zqvmvB3aYS0P5QhcNXCTWRUEwPtbcou9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8u43aBEWBl8AhYSgDveusMZHl+Co4nQDmig9SaAJww=;
 b=iY4W5DVwQy3yXRavWIJBfQq3eaYlWIvGAExKoFOs6AIHLAGzwPiy9+JcZd3VBcAzWI
 sw+zTOm10yMwsSGxTBVVo5TOd1yEdmVCgifcKDq+qL4QyZE4opPjjasX4F2jD3BhaipJ
 wBoy9RoIsvJDgcfJDkvJJ5o1Fw8fj/WqgiYchXu+tffjNNOO/YycT7iSIAbBFvRp//qt
 vH432oTd0xfVst+9EAtvbRTp++fvnuaDctFS+LZz0UVU3EIMUpivScDpziiIY4LFCRqf
 kbbJY/HxVbZwmHQgDmkLWiusFwss64zCjYFzLYJmy0Q0bMpOxKMHJezH8GGD80whBhQ7
 U9PQ==
X-Gm-Message-State: AOAM533BJTV4/KEfwZsAXmrEsP7ChB9YEsKa5XXdhG+OtzY3b7rEaNPR
 vz1kNRZNb62w4DJl7sjq2MplXkusUJ/zjdrgicsNzQ==
X-Google-Smtp-Source: ABdhPJyvkDC9wNhRJd85oHgAsBzXQeQD7yShpEQBx5Xui2GXV+9MOt1DQRZgCV38bZfAQc78IxwnH+jT0vtNjfqqcUc=
X-Received: by 2002:a1f:9f4c:: with SMTP id i73mr17028716vke.9.1632186700702; 
 Mon, 20 Sep 2021 18:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210920175547.1.I72392b8ba601c9d559c976adcbfb03bd5b559833@changeid>
In-Reply-To: <20210920175547.1.I72392b8ba601c9d559c976adcbfb03bd5b559833@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 Sep 2021 19:11:29 -0600
Message-ID: <CAPnjgZ2V=r4u-K+w5irc_giLNj0X_Dr0x2kBhogC+Ed+fe8jDQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] remoteproc: migrate uclass to livetree
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

On Mon, 20 Sept 2021 at 09:56, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Use dev_ function to read the name and boolean to support a live tree.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/remoteproc/rproc-uclass.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
