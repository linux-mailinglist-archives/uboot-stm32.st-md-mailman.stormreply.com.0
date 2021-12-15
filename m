Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E6476151
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Dec 2021 20:06:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85CE6C5E2C3;
	Wed, 15 Dec 2021 19:06:42 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D68EC0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 19:06:40 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l8so22884442qtk.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 11:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJmh5xV2s3O8ocpMR8VdwdgM0htxHvZ0mMN+MRQVDjc=;
 b=Y7tHFPE6IfE9/M9Y0qRCbvuiQgUz0nNnMRymsp2em3A9MjkJ8YidRnmTWuvioyjIQf
 ld4HFNX+xUi8zdziABFpeyQeEM3RQbEIcrjne3b71wQHwv8Ph55XJvD1kl/TBvzEYyTa
 YZZZDxLa8zNqmHErI6QMpyn++U3cbL24l6/TUTDcAZBoc2plAeZ4j7ySW69VPAAZr7pp
 qCBREzo4aaMLj0+6XdXCvIlmH9KZrZ5EGQteL8wyjqUDz+S8N4l19NsprQAUl3BtWzKV
 D2QLf5bKKKGPYj6zeyK0N1tTMUFRTNCA+DipW1VqEHvsFnR08G2WwnFCBRQjIvDczj2J
 5Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJmh5xV2s3O8ocpMR8VdwdgM0htxHvZ0mMN+MRQVDjc=;
 b=uxsjfWOVtID2uxXyEL2Nbzhm5q+WPtnubdCGUgevLk0sUyrgpGBFbk+db49b5VFOna
 jVfHoS4eGVJyu2+QFLuwDEalaZSan9/L9+XjC3FrPMtTmZ3e3JsKG/kJcUKgnqzNWvju
 5bzFMkZQrO3eS2LvNYEYsK2gzXQ8OKrA53QVNHtSNJCuV1ttVfMCRbD5ryN2hbFjKKNR
 jlapt7a/jCrFEQbkI4Hk7dHfb6XuBOVE8LpScmqCQJ63L/JxI+ntTOI8U9+mQkLjMTj/
 JIkjIX3EpHA9kcobo3aMhdwxaZj8rKtB4/yTGcGcR9VPgtuZbtw2zooPDC+F1/ZRsm0P
 lUow==
X-Gm-Message-State: AOAM533fIwenb0qecEUT3o0WDVfwQPH2v+wGpXU8ESCW2pwTq14YSqoa
 i9rCAkMmf7Tl/J7DS367veE=
X-Google-Smtp-Source: ABdhPJwXyNfdHIEcewDrpVykAoKmwN709W8Xw5E51ierCTch4+lNYD9TkfJrbZQAezv3Ukbq/TZFIQ==
X-Received: by 2002:a05:622a:512:: with SMTP id
 l18mr13779884qtx.120.1639595199204; 
 Wed, 15 Dec 2021 11:06:39 -0800 (PST)
Received: from godwin.fios-router.home
 (pool-108-18-207-184.washdc.fios.verizon.net. [108.18.207.184])
 by smtp.gmail.com with ESMTPSA id o17sm1507887qkp.89.2021.12.15.11.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 11:06:38 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
	u-boot@lists.denx.de
Date: Wed, 15 Dec 2021 14:05:24 -0500
Message-Id: <163959510790.2783654.18313194395742100132.b4-ty@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
References: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] clk: cosmetic: reorder include files
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

On Fri, 19 Nov 2021 15:12:06 +0100, Patrick Delaunay wrote:
> Reorder include files in the U-Boot expected order:
> 
> the common.h header should always be first,
> followed by other headers in order,
> then headers with directories,
> then local files.
> 
> [...]

Applied, thanks!

[1/2] clk: cosmetic: reorder include files
      commit: 572c446e98e224555be1ae2add1b49ff1a60ed7a
[2/2] clk: define LOG_CATEGORY for generic and ccf clocks
      commit: 560e1e005093b1d62c53391d68960237294e7f89

Best regards,
-- 
Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
