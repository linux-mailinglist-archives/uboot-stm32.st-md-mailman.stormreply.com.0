Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 031117830D7
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3E0AC6B44B;
	Mon, 21 Aug 2023 19:13:41 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5BA3C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:39 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-58fa51a0d97so30697537b3.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WMUW6TO7s4OLrsUBbRmCbu/zPPoacMK3PJUQrMs8n/A=;
 b=b5u55BLTy7pouY6+gwfhqvLKEDUxrhsRmUV1KahwHSLnEExOvw7yfyqcUYvOdRQCJR
 XvC645v0lf2wIttAFZbgAm6aeJxRaC0TLipkTzbUhBIdbT2vzb9ka9f1mWSq9fNjpcWA
 HIcLhd3+Eq0l008Pdo/6g3TEM6sl3aabVCkhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WMUW6TO7s4OLrsUBbRmCbu/zPPoacMK3PJUQrMs8n/A=;
 b=ddCE/oyyKs1o6fwL6Mu5fOCL7wfxBm6Okk1r+MiEguLjWs7bjI+loYk0DULJ24BBzE
 xWXDCYAFlraxTPjRq+SXw6O3bVjgLAndDz9BNrM33qB5eRpEL21vlkLtvu5ll8o4nZl+
 TKdyZStenyof1iko52x2LV8STOI0u9+HoJq63ECZprEk8d3t8SoYtFT0qjGZq/xrHHGA
 oXoxpOBMOiuOWR8KSOLjMrjrvDZZXfm0KD9fgrlWBH48QO1NWDhY+Zurk82MuxjCFos3
 YAXAHzZazI1ifZrxFp98FsxJPmZ3V4LPozJL9nnJrJ8G0sqhY6bdYOFBKvVaiqMoUrFt
 HyLA==
X-Gm-Message-State: AOJu0YyujGGr+PoiPUfrfaSsxqfmKAfPkFd2TxHhpUKAqzHlN0tXqZxG
 lTYW+MRPhzJ408iX3Cra0v1rwM8qzoHS7a0QMDzMKA==
X-Google-Smtp-Source: AGHT+IHQ8ACty7XUYY5fYJQe5Mv4PycpHviuRMD838wb6yQ8F1vGISm07MO6Fh4CTcLow3LoDqRPk8BR//6tQoK0l5I=
X-Received: by 2002:a25:6954:0:b0:d4c:f456:d558 with SMTP id
 e81-20020a256954000000b00d4cf456d558mr7590941ybc.13.1692645218715; Mon, 21
 Aug 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-2-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-2-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:46 -0600
Message-ID: <CAPnjgZ29b2X0NXWMUXE=FY=3mojzqjPpDgqmJvZNdTBtg8UiYQ@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 01/13] video: test: Split copy frame
 buffer check into a function
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
> While checking frame buffer contents, the video tests also check if the
> copy frame buffer contents match the main frame buffer. To test if only
> the modified regions are updated after a sync, we will need to create
> situations where the two are mismatched. Split this check into another
> function that we can skip calling, since we won't want it to error on
> those mismatched cases.
>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Add patch "video: test: Split copy frame buffer check into a function"
>
>  test/dm/video.c | 69 +++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 58 insertions(+), 11 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
