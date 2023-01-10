Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C33664CCA
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Jan 2023 20:51:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 051D1C6904A;
	Tue, 10 Jan 2023 19:51:40 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBBB6C65E59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 19:51:38 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id j15so6414682qtv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 11:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SY95lb8Ds6ePYtH6uHTMgxKnWBTM25jcbCTbsw099DE=;
 b=RB24qC6GjaEHb5SoPxJCrTpHMr6nHpzSP3AjttSPVFpQ5Fm8EPlgoPTaKSzQZXoXOH
 0yuJKpPC5K8R035kGKq5E8Y1SJCBfnlFf0tUt4+se1mi8qn8BkSeXhE4GdnZ7bPwr50E
 mPBuOhK2Kor2k+LfskYfVRTOhQGzh1xP4uClI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SY95lb8Ds6ePYtH6uHTMgxKnWBTM25jcbCTbsw099DE=;
 b=c8zzx3NaoBGn9EFeQ2xY1Bqs1HlBtFm4qz8PQxbqwXOJDAcoNlsLTxKXLvT3yLFZD8
 E4wa+1g31pzpd4lAmN2NkpoD+BiJ9+kMuQhmZz3Pw2GarCrisyZ33q3q4sk+2LKmyvdJ
 6VrHnwT5tjUbc/G43z45uKtcVBS9Rg+LrYbCYwbvr4S6S8Lcwqr85aMHthVK9ppXCLPY
 k3n1LPdLe+btOLuuAdHZpMYT6sq9iK9Sp1hUwtppZMHRyBRmn7ic1NhNnoVeJcTo7WkE
 FPtn8l5MKX/Axp8PP0bd1czs5Kft+3l4J++2/0o1uez+FzdBHbtQUN72wynYPbuzuiNF
 FgyA==
X-Gm-Message-State: AFqh2kp7rEsCMSCnKoJRVPIueDpVuysba+/TATUzAmYLXqey/eRbbhD9
 kMx7bwc1i53nokWVsxNFke3L/w==
X-Google-Smtp-Source: AMrXdXuwYQuEpLsV4wpKF2n8NUbljHn52Hfrw9SW5C+MdApD5fIiE3c9GLw5F4Kfu7YjwKYD5zWjvg==
X-Received: by 2002:ac8:5401:0:b0:39c:da20:616 with SMTP id
 b1-20020ac85401000000b0039cda200616mr5274949qtq.32.1673380297621; 
 Tue, 10 Jan 2023 11:51:37 -0800 (PST)
Received: from bill-the-cat.lan
 (2603-6081-7b00-6400-2c2f-ce0f-8dee-7136.res6.spectrum.com.
 [2603:6081:7b00:6400:2c2f:ce0f:8dee:7136])
 by smtp.gmail.com with ESMTPSA id
 v4-20020ac873c4000000b003a7f1e16649sm6536450qtp.42.2023.01.10.11.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 11:51:36 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Tue, 10 Jan 2023 14:51:35 -0500
Message-Id: <167338023359.4124702.6749594042423833557.b4-ty@konsulko.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 0/8] env: mmc: improvements and corrections
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

On Thu, 10 Nov 2022 11:48:57 +0100, Patrick Delaunay wrote:

> Update in U-Boot env mmc backend with several cosmetic changes or
> corrections and 2 new features:
> 
> 1/ CONFIG_ENV_MMC_USE_DT = no more use CONFIG_ENV_OFFSET
>    in the mmc ENV backend when this config is activated.
> 
>    Requested by the STM32MP STMicroelectronics boards which activate
>    several ENV_IS_IN_XXX; the value of CONFIG_ENV_OFFSET is invalid for
>    SD-Card / eMMC boot; this offset should only used in SPIFlash backend
>    (sf.c) for SPI-NOR boot.
> 
> [...]

Applied to u-boot/master, thanks!

-- 
Tom

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
