Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3BA2C8EBF
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:12:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE53DC424BF;
	Mon, 30 Nov 2020 20:12:43 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BB2AC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:12:42 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id c80so15604460oib.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZ6pu0eqhlQQGPnRJpZjtZhfxap3p2IJydqu73tmU6E=;
 b=O9mF+gcjzaEuIbCu8pWr7PlmB7pT3guhX7/TWjrLnvf7ACObNv/PQOnIWlnCc/dEZZ
 o+BS2vyJwf95vHIcRplzYUQzwhamstDXDp83d0nm4RrsIzw90fux8zACIOJUVlZfJNJY
 BFKnhMqOiXIweRICsHLNyNNAKeKOUV0hLH+Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZ6pu0eqhlQQGPnRJpZjtZhfxap3p2IJydqu73tmU6E=;
 b=SI73VT/amYh8VEpFGXFaZTvI5pltZgQqt/hwv2IYw1/H9umXKOAF+HZ6ac8e2qys36
 CFu6QCbp2kMlyh8HrubRI7oljWFgcHesfq8Od2kwYdmfQuOxWwL6PwL9FWWFXsO31XtZ
 juCtQSPemxv7nPUQQ9zNLskyEHBv17R4I4V1TfBgIVrnWq+zTnUbhInaH8CxxjZWFEZu
 QfEbe4KjxPjC4KZtHmHgAdht3n0Fa9XULWNN1IOate5bRVBsVPvY35uxxDhlbAJQsPeL
 s3kasS4Wzisyp72n+sPUdM9j9pISYdztBXCxuPVohhqllU+EliR14gcKybOBBFcMsecK
 9S7g==
X-Gm-Message-State: AOAM530DjiH+jgHj/dSw1XSDBnWkEG26vU+ffdMMUlPaYxwjfxii5bH1
 PSgMdE5j1gYLigaSD+lqPMAQ1G2igONRrd2qtWq2fA==
X-Google-Smtp-Source: ABdhPJwIRFUOa8k/rONobOO0lCOutJ2oeHRHrcKEFCNZaHpTOcTHCTJ9jlBdmmSHcqglQk7fHVK2B2E8MztutZKvTHk=
X-Received: by 2002:aca:ab95:: with SMTP id u143mr479328oie.53.1606767160723; 
 Mon, 30 Nov 2020 12:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-5-patrick.delaunay@st.com>
In-Reply-To: <20201127102100.11721-5-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:28 -0700
Message-ID: <CAPnjgZ3XMp+YGNxa1bU=+VAdOhb-grqJovFQ01VYnEHHZT8k1w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 6/9] console: remove duplicated test on
	gd value
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

On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Reorder test on gd value and remove the duplicated test (!gd)
> in putc and puts function.
>
> This patch is a preliminary step for rework of this function.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - update gd test in console function puts and putc (cosmetic)
>
>  common/console.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
