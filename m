Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366B282EAB
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 03:42:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0C17C424B2;
	Mon,  5 Oct 2020 01:42:21 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB358C32EA4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 01:42:17 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m11so1561543otk.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Oct 2020 18:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uaiobp8iHfeL6o244ZdGDV9WAM8uyxWP+lG5oyIgFcA=;
 b=OuWrR5sayq2HvohNfLle78gf/EZoBosd8RwQ5dD2datuVGVpNQWPRT1I4CvAEtSKQC
 WfsPum/nLv9i8iRBX037IrrR714/EqE99zxuFlw8OVhsHD2nh0bzKoYgFHFXFNOjE5sB
 RV0g/6D7aaOBELJBJ696zm0MyOPAmjxp1pMYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uaiobp8iHfeL6o244ZdGDV9WAM8uyxWP+lG5oyIgFcA=;
 b=exTZujSr4F8BUgWHBJNEK2c7pjnuizGlriu+ir4PQO7FlMWPKXozAjrnjecsR2MlAN
 xd+hd2vLTMfrvXZD1ljzALhxC+uGSlHttr7RSCo6gDdzwvCJJdUWSGU05XYhYTmgl7sM
 +1hJZVrgyzHap1O4idVJ+olwWtJcxct5SLOywpEK4twx/iOSwI75f0jd2ss0pXcHtxh8
 Va3Ig3inaYADyKicbSES8z31G+j54jfZtYtfEVdPIZEy/tRs2GCH6ZB58UCs5+fzmq1d
 BqlOohEpNyx025tX1frdr0+BIrk0ntr3XteJ8fF5w1yMQp/7NkdWh/g2I3KwHGTaegup
 QRVg==
X-Gm-Message-State: AOAM532v1eFkksu2Gy+yCnR8xXNDI4j0yLCi2QwUDDkUrjsUlACLS20U
 La6CbPxPk/4QNGpDmEv3hThjPc/TP4PWbnrfOU9MBQ==
X-Google-Smtp-Source: ABdhPJy0fWoByejqotaKdjl29fAb9Ur9F2q6ikZjnjNYXRLZr89IOGMVga1AB2Eia5Qqm6nxLE6cUvHhVw2sYH/w980=
X-Received: by 2002:a9d:6c4d:: with SMTP id g13mr9232407otq.367.1601862136590; 
 Sun, 04 Oct 2020 18:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200925074116.16068-1-patrick.delaunay@st.com>
 <20200925074116.16068-3-patrick.delaunay@st.com>
In-Reply-To: <20200925074116.16068-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Oct 2020 19:42:03 -0600
Message-ID: <CAPnjgZ2O8DvUQ6CsWeWQbabidqkK-zg04xKd4gCd+A0M8ZTZCg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Heiko Schocher <hs@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] test: dm: add test for phandle access
	functions
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

On Fri, 25 Sep 2020 at 01:41, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add unitary test for phandle access functions
> - ofnode_count_phandle_with_args
> - ofnode_parse_phandle_with_args
> - dev_count_phandle_with_args
> - dev_read_phandle_with_args
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/sandbox/dts/test.dts |  1 +
>  test/dm/ofnode.c          | 75 +++++++++++++++++++++++++++++++++++++++
>  test/dm/test-fdt.c        | 65 +++++++++++++++++++++++++++++++++
>  3 files changed, 141 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
