Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B824EA5A
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Aug 2020 01:18:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C631C3FAD3
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Aug 2020 23:18:16 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4615FC32E91
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 23:18:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o4so1148285wrn.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=wpPvSiu7oLlEkmJR5EH5Dhlx+aEbY5JqF+2Cel4WL28=;
 b=Fc5w1JsUfeSb8auSmctYDjTVvSBnqnmdNTOT9YGxvH/pl0LSQ7aXe3Jm045me0hac7
 Ya1rjQCA/I/lfn9V4hG1sSvYuhGAep0lC4ezzNrdOo/DBVrmtzpWgXMFJLHdyVbb+nFE
 uX+9+zImW+reiUHbABWN631GlBZtizq0Px+O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=wpPvSiu7oLlEkmJR5EH5Dhlx+aEbY5JqF+2Cel4WL28=;
 b=CPI8S0MjRB+zVwjiFb7vXUREv4aTl2UsZfA4ugU05PwcEA13kwLipLyXpvTMs/opAW
 dr9mnK7krEFuyWWJdORJ++jvUyml5MOsGSIgBE0F9wn+721zc0bRaZM0txjbPJZbHNa/
 YTr7Omu8v0SRn9Nnven+1e18KNJjH4jZQpINt3X/BRGrFv8npRPwQc2LJavw+1yLZrRt
 PSjb/kjUBRY7EWykegwNqIAeQ7dMM7l9Ue2fAgFiztDO5DocCoXvST3t1wiiQOnp+5gv
 nAH7GI28EnfJ/LKQoZdRaZ0tbfQX9YUkoUdL2dUVF2EOrpf9Zfr90/ObqZn8RgwLHPjz
 XXaA==
X-Gm-Message-State: AOAM530d5YZGABPoDdDwDhG0w4FHUlwTGBdZbs5MzQTc7DdHtdw9y06J
 Qcfiqn5x52pFDWWLPTuswLOUhBR4UgAo+7tu1pVAeA==
X-Google-Smtp-Source: ABdhPJxT8id4piyNOE/vrBJci9//eqHsTtQuqwP65E8plPBKuYKT2z7nu7nFfCymEo6ht5bXZx8Li4U/5DXF9eBeYFo=
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr8530575wrp.412.1598138294597; 
 Sat, 22 Aug 2020 16:18:14 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2020 19:18:10 -0400
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20200728071335.5840-3-patrice.chotard@st.com>
References: <20200728071335.5840-3-patrice.chotard@st.com>
 <20200728071335.5840-1-patrice.chotard@st.com>
Date: Sat, 22 Aug 2020 19:18:10 -0400
X-Google-Sender-Auth: p989lLOJSFQSNuC_1svM5nP_0xY
Message-ID: <CAPnjgZ3tF_M8ZCqctf3okJp21rs5OKBp7C76rni+t0+dy_anvw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v5 2/5] sandbox: phy: add driver_data for
	bind test cmd
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

Add driver data to existing compatible string "sandbox,phy".
Add an additional compatible string without driver_data

This will verify that bind command parses, finds and passes the
correct driver data to device_bind_with_driver_data() by using
driver_data in the second sandbox_phy_ids table entry.
In sandbox_phy_bind() a check is added to validate driver_data
content.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 drivers/phy/sandbox-phy.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
