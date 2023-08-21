Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 083AD7830D8
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF7A6C6B44E;
	Mon, 21 Aug 2023 19:13:41 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E63D5C6A5EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:39 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d746d030a86so2708500276.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gMx4SAEmCOEjypXqFCdH/BNDX1/vIZARR/zYEociwpo=;
 b=RhXqEdoWW/phumjtMZ6oVIIfsHpnZY+nsmeAqb82rsJCcxlqai7RfH9TWpNInLO52M
 gycx9U8pKYiJ+hc0Y6JBkuAkmw5Z5f3Lo/y3QzyDKcK8Fy2XMpp+rzCxsVVzUfjnsrBZ
 QpxzRIDJkxWkAe/2AP3H18Pc94C3UUx30pBhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gMx4SAEmCOEjypXqFCdH/BNDX1/vIZARR/zYEociwpo=;
 b=SqiDZ1HW9krbhcm3rGQZ8MwVAZfn7VfQH2AqjocDvfRVv0DbykN5h2tPIDLriz63F/
 GEhEjJmTIpzjQL0+IJYzezLcYgo7u+qT/9bsAVW2Jb6bVyzOalVn3p+q7r1Y75ePKX34
 DWwIwAlkOtvyR9uqDSx7TLphqEhtvDNs0AdwBR670mcO5JuaFsgMwPaHJarxObNJBipt
 heCJztmBmIUAqcCLSm8uAvIoFpSa72J8cayR1q/w/2pZboD7ov7TxN81T9glqvT/mQCx
 Fq47UHAhjK9vI81Zsj8siA/PuNROQvuDZP7XGKib6YmL6dQU72jtPDy1cgGEvJsVY7x6
 5vwQ==
X-Gm-Message-State: AOJu0Yyzs2+/5Yxzgiyc06PhIUQTU3jJNan6+phPCltwcoXdCHBnMtNv
 DJueKskIPUNWBMtNdsmTNL0xpPzaSGIoZTVEPMGFWw==
X-Google-Smtp-Source: AGHT+IEVvHfYOacHVBGBIAhLYpfCDFP69Fhjan2SdnF/CmIsSiJQ0rgd3ECVipfuWc/GSYjqvjU5CjCCqDlxlIU2Ne0=
X-Received: by 2002:a05:6902:18c6:b0:d53:f8e6:8447 with SMTP id
 ck6-20020a05690218c600b00d53f8e68447mr11064045ybb.15.1692645218711; Mon, 21
 Aug 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-4-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-4-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:48 -0600
Message-ID: <CAPnjgZ3Tpz+3EbxnS_qU=vHRyeCx4bT14J75ZP_B5+CiF_5v8w@mail.gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 03/13] video: test: Test partial
 updates of hardware frame buffer
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

On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> With VIDEO_COPY enabled, only the modified parts of the frame buffer are
> intended to be copied to the hardware. Add a test that checks this, by
> overwriting contents we prepared without telling the video uclass and
> then checking if the overwritten contents have been redrawn on the next
> sync.
>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Add patch "video: test: Test partial updates of hardware frame buffer"
>
>  test/dm/video.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
