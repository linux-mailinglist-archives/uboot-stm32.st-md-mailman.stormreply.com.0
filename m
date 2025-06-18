Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C176ADEEC0
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Jun 2025 16:04:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B07EFC36B31;
	Wed, 18 Jun 2025 14:04:05 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28EB7C36B30
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 14:04:05 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4a6f3f88613so68617771cf.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 07:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1750255444; x=1750860244;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62V/BhmujVKnCh1Eup54V34S+R7BfIhjWGqncsywrls=;
 b=TQAgx2tpuo0IUw6q9cH5m3eWQ5YFF+sCt/5WwzrVdB3E5OGx9RefGpcPlNTree9FQG
 WDInqHNQb+3JeX9LPz+9IItEuUQWSuCXNawcVwwSqmdN4oLNC8US+WrdG18gQlDSwGhX
 6KvQ7rhIAI5n0ugBB5hp6Expi37puEcHXriHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750255444; x=1750860244;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62V/BhmujVKnCh1Eup54V34S+R7BfIhjWGqncsywrls=;
 b=rESaK5T6NbX3vOUIzvOaFYaSO1ZjqbPf3DQayusuJwVsSbPUFoZa2XB8BtX9yZPjyb
 yxKpibG1rP1nVS3gIhpe/fvMjN9gKtug4nbDVc5Palf/tIgcey5J5MHefIVAu05X46ub
 7NJEmMO+kSjsCnJWAPkc0LmhNfS3I9iBEtoHitOeEOWo+xAGA0kYMMkKvvzqxzWuI1XO
 O6gWVf6nk7ypyIJyCAh9c/SpmgmZADxeRCuOSwr5VBKy7vdzTesqwNe8V1wA3fJF4lwI
 iEA2R+QjTDel+a0PZchTGpMMb5KTDioB7vDLZQuCWnBgaaG5CWBEuBuKzpJ2BE9a/pE2
 ST9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEphF85ZHAyVQQTLXVcwepz8fpChd7q+Q4kT3oMIeSWpCU8AjNBITSiR/KTYkuasG3ecAMwVa5orOmdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxP/v9bHyTcNvxRll8UOWx9BahKteC7d5+mLMgdCVl98qLWqFEZ
 /4T/ZCRNCINGSAZUNwaLamumqfIFuPrmdSJXDEMfysbdjGJv8KxISaa4WNCujBpWrtUpfitRUv0
 O4AZ4Cy8=
X-Gm-Gg: ASbGnctXpU0fOWRRsVACzJwHMFBrPosqDvi0M4KWlsCs6dj45fn2ZLL7AhZEmoBg1TY
 Pw/FMwzOtkCkJY0NXVu8vfg4Y/VOZjngf0rQz8RRVdlOT8r1hpVgvvyQ9qg+3ank3m/wJVcD8It
 v/2LztSo5K6P+T+WpuZZlmFyxq2d4xXBY0MAOR2cI3k60JrILRQO/U87TE8hB4o1HA6L6LqY8mg
 KZ/qtXmuQzow4YZJ6mkVDfLWOHT9z4opMz4YRaCjbHTXhpKoRJkhJfS9NcJTcG47unNTdLgMpQP
 QKnc/f+mHCBYbswAhTWgnj1wumnkCBL43GTMBgs40rZRBgikoCZDg2vTncwUrG3DcN+GhZye2ij
 eAs147eci+SiTRfjSgnh/Hw==
X-Google-Smtp-Source: AGHT+IHd23PsFm+liOV6f+YupcrKZSFTw0VGgomB1RRf+3CJ7r4ecIux7IRdjiqV9tEqDL/KqdWPhw==
X-Received: by 2002:a05:6870:b02a:b0:2d4:ef88:97af with SMTP id
 586e51a60fabf-2eaf057ce1emr9634215fac.3.1750255431849; 
 Wed, 18 Jun 2025 07:03:51 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-100-42.totalplay.net.
 [189.203.100.42]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2eab8910463sm2797192fac.11.2025.06.18.07.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:03:51 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@foss.st.com>
In-Reply-To: <20250616112749.17311-1-patrick.delaunay@foss.st.com>
References: <20250616112749.17311-1-patrick.delaunay@foss.st.com>
Message-Id: <175025543025.7476.1231836682265621641.b4-ty@konsulko.com>
Date: Wed, 18 Jun 2025 08:03:50 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 jerome.forissier@linaro.org, Casey Connolly <casey.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v4 0/3] Restore support of short name for
 type UUID parameter
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

On Mon, 16 Jun 2025 13:27:46 +0200, Patrick Delaunay wrote:

> V4 update the test print_guid, as "ESP" is a known part type UUID under
> CONFIG_EFI_PARTITION flag and no more CONFIG_EFI or CONFIG_CMD_EFIDEBUG
> or CONFIG_CMD_EFIDEBUG
> 
> test result:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/26699
> 
> [...]

Applied to u-boot/master, thanks!

[1/3] lib/uuid.c: restore support of system partition type for ESP
      commit: 73d5a68fec9e68b2278d83625d6f8bbfcb33e2d5
[2/3] doc: cmd: gpt: add information on type partition
      commit: a3a5179b1c9eafee0850aa653384cb8c23a4f79f
[3/3] test/py: tests: gpt: add test_gpt_write_part_type
      commit: 7a598e633a5376ddae6a96bfcdb28c8e7b422b0c
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
