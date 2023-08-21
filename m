Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF47830D5
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D7ECC6A5EF;
	Mon, 21 Aug 2023 19:13:35 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C242C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:34 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-d650a22abd7so3865319276.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645213; x=1693250013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DUhATtX6fHYk8encCFexcIKwHerIuhM5nQ0BLgnNwow=;
 b=bCEhp/hbJsY+9h3/BIextNjImzjBvUy7u5oc7MniBZCO5lbcgD1x65ytact6PWkrrQ
 DIeaHa/tXM9g4NLbWyY7ioZZJGilQLEIs+3m94z6QrP/pJUYHqAQ6+PztbzWG9YDaIPq
 S9PqrfKH8khtkFwzkVMhkNdFOvZr8NH+1uQLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645213; x=1693250013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DUhATtX6fHYk8encCFexcIKwHerIuhM5nQ0BLgnNwow=;
 b=AxIl0cgFRVmZiWjhZteuabgNTgs4NWwXjTKRoh+BoS1zpDUhifaWmVV48NHA8e+kB6
 Xpn+sV6xb8DpyifhXjLt7tDs1zqAvHBl1HVBRo5xuePHBRYLMQii4OSZ03ra0krffxiA
 Xy/vti7XU03D51gGQc243FGZBUxI8bYXhfhIJGxCRWE1093EONxTReei+2LHgBczI6k/
 XjuZDzmVo0w8xJ2spPuFvDLCkcy3jeOYdyaoOEInWSnBOKa3y+IQqA2uDjFnRVN3V34o
 G1S+Dxlyi8GJDd0ePCLw9sp0fOx3pHOlf2WgQB2NoN/sBke8WO6/rJT2LKgLSYc1vc8I
 VR+Q==
X-Gm-Message-State: AOJu0Yz5IGiJdN6CPeI+f60yHNOODl/ROM67bgqH7z9VyzEvL8WiRMCA
 EFTdP6hjQ7//+Q86N0VnIC5tO432wmivYuMphNUD1w==
X-Google-Smtp-Source: AGHT+IElj+uFXu+WgOnlj4oCsS48lKoYyo3yhONc9rH/9NEhjitoHlHUYz8XzsirHLdw1XHcbA6rdzubM8N18apKlvY=
X-Received: by 2002:a05:6902:50d:b0:d62:be1e:1622 with SMTP id
 x13-20020a056902050d00b00d62be1e1622mr8145282ybs.38.1692645213130; Mon, 21
 Aug 2023 12:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-3-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-3-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:47 -0600
Message-ID: <CAPnjgZ2u9B78we3ta4YPSEsofO4GydG9HQRs-wTxFRXp0fRFOg@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 02/13] video: test: Support checking
	copy frame buffer contents
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
> The video tests have a helper function to generate a pseudo-digest of
> frame buffer contents, but it only does so for the main one. There is
> another check that the copy frame buffer is the same as that. But
> neither is enough to test if only the modified regions are copied to the
> copy frame buffer, since we will want the two to be different in very
> specific ways.
>
> Add a boolean argument to the existing helper function to indicate which
> frame buffer we want to inspect, and update the existing callers.
>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Add patch "video: test: Support checking copy frame buffer contents"
>
>  test/dm/video.c | 76 ++++++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 35 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
