Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D7E279D64
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Sep 2020 03:59:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58BCDC3FAD4;
	Sun, 27 Sep 2020 01:59:42 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A096C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 01:59:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m6so7971054wrn.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 18:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=fVvMf07jO9E9PL5973wxmq/AH5MEEVp824+e3SbS+N0=;
 b=Fjk7+FzCMxdJi0Of3Qc8L/6Dh22ggmnR/syplOELRxmQcSJqzmhpF36DQgQy+aS0LY
 GCKRjX5Sim5uKhvLT6b/UfmuGe8dKPfmGEILYb4JyvLV7sHJW4pccBcWkLs9QKYtkZod
 7m9JSK72mtx/eFolusY9Zw7xxDnqJs4gQkSkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=fVvMf07jO9E9PL5973wxmq/AH5MEEVp824+e3SbS+N0=;
 b=PXOQlhg/qUISCV9ka9HcH+4bLlZpwY0BbprIvt+Z2KF0UayIICSLS62vigIaLCxxLi
 RgWYH9wTrEEfUSbsmjFwkfG7DV5M8TJAQAMbMDvMhGfWFaFR7QzvOfWmMnHl58NbHZjd
 R87Vd9AVaDx5lNistEAUDfnZDBGN3tunqA7JsB3pXpszQjBoqZd6Wv8QNS4qKxH1pc3W
 /VAh68uOO7dtsRRMJXkKGZgCGY6Q2IXN+xqOqciFLOpJRqVsYQb6Up/HPqML8cVTVoN4
 878bvYwmndbttVEyucpWoA5POgUoaqNzfxnTg80HU3k1MXTf/7N8svae8ZIkbhICcJHc
 kG2g==
X-Gm-Message-State: AOAM5332oZ2nz7coYMuuekRTDSdcd3quZyatHxIHHU5YaR/90zjwj5Pg
 9qqC96xnsc6XHin2bmWhXVAjJM8s1tgcWXGLFhILFGWdbyGK6A==
X-Google-Smtp-Source: ABdhPJzAIiL1LLnME8qozR+Yah0QTpmTbtz+VTDDBoDOMto9uMfA743KsgXSJai3YtpJWs9YkYd9C8pB0Mx95lKWtDU=
X-Received: by 2002:adf:81e6:: with SMTP id 93mr11710317wra.412.1601171978930; 
 Sat, 26 Sep 2020 18:59:38 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2020 18:59:35 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20200910104956.v4.3.I1b5c7dcf6c43efa10d18b4bc707055fc15fb36ca@changeid>
References: <20200910104956.v4.3.I1b5c7dcf6c43efa10d18b4bc707055fc15fb36ca@changeid>
 <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
Date: Sat, 26 Sep 2020 18:59:35 -0700
X-Google-Sender-Auth: oxzydkGaUfbkiyYo_N6tU-rWnUg
Message-ID: <CAPnjgZ1VnWQwhR+Jkhp9vzVTS4QyD+Rb3XXtOZ4EZcFu6RU=Ew@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@st.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v4 3/3] optee: add property no-map to
	secure reserved memory
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

From: Etienne Carriere <etienne.carriere@st.com>

OP-TEE reserved memory node must set property "no-map" to prevent
Linux kernel from mapping secure memory unless what non-secure world
speculative accesses of the CPU can violate the memory firmware
configuration.

Fixes: 6ccb05eae01b ("image: fdt: copy possible optee nodes to a
loaded devicetree")
Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v3)

Changes in v3:
   - Fix changelogs

 lib/optee/optee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
