Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E64E7830DF
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3906DC6C822;
	Mon, 21 Aug 2023 19:13:42 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52ECBC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:40 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6bc886d1504so2900007a34.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrvX/+Y+xBV4GzVOui8hB07YDsT+Fy9wVNWzIvOE/QQ=;
 b=a7iPTYYiGFowaVuOPpE0yxIvMMf1LY4mLcfrNzqLoa/EMLhhOQu8UowfkwxXGSkTtV
 2xb0CMT9pf2NHdTP2az5IR/Sk5l2D5L0GWh6HzZObmshKS8GcKiixY7585dSIEIikuHw
 pVsLj6ZEhCiBsu57o7uiTj1/ZMZkVctRtjPyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZrvX/+Y+xBV4GzVOui8hB07YDsT+Fy9wVNWzIvOE/QQ=;
 b=e7sxgKvslTCVaSRHjkVY8url9ibIxGded7jf6o/Li84BS/cK54bt4Ai8dHsi10f4kq
 Q9waND/qMtpGfPaBv69zSy8n1ebuj4wAUh8IzygnElgvf3jrI9wOVc363C5yLaXiukx9
 R2M3X7pm/4gyIrmAgZkOLFrHumKguPmh1tNA26Tij50Ml1T1lasukvPV4LyOTff3zbxA
 44SvEnbfApTN+9Djv+DhcG8JL9X7TZ2CPx4+6PS/zaZpjknR4PVQVxYykw5F/EUTcZ+4
 4a/w5GGZab5ZkA8S4cBpzzjTMP9oOxqTgPGu1ToG+4Dqd7KkS/n0mA1F7u0QpUrltCc8
 PYQQ==
X-Gm-Message-State: AOJu0YzC9+JRf6HYiWi6sItVOeMNSs6oAY3wKNOCdToKFTP+iBAYsilz
 Ws8u01LPkxAfEyKubbe8GiIP2sm4ITux49V6IPE05Q==
X-Google-Smtp-Source: AGHT+IF73LEANYqP925WGPT78QJlqd/bqVgU6FHI9UBCx8jj0DInYWNHg7FC3HJLATGN7UDr4F+1ZO5UzfhpxRTgmLM=
X-Received: by 2002:a05:6358:7246:b0:134:eed0:3bc5 with SMTP id
 i6-20020a056358724600b00134eed03bc5mr7625388rwa.9.1692645218757; Mon, 21 Aug
 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-8-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-8-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:55 -0600
Message-ID: <CAPnjgZ2HEjkAHXVh4utmnJUh=hE5XxCKorXRGQqkEUptxN_WBg@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 07/13] video: test: Test video damage
	tracking via vidconsole
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
> With VIDEO_DAMAGE, the video uclass tracks updated regions of the frame
> buffer in order to avoid unnecessary work during a video sync. Enable
> the config in sandbox and add a test for it, by printing strings at a
> few locations and checking the tracked region.
>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
> This is hard to test because most things issue video syncs that process
> and reset the damaged region.
>
> Changes in v5:
> - Add patch "video: test: Test video damage tracking via vidconsole"
>
>  configs/sandbox_defconfig |  1 +
>  test/dm/video.c           | 56 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
