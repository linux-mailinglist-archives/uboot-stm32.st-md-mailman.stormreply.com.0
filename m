Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 141A84C3E87
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Feb 2022 07:43:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC743C60463;
	Fri, 25 Feb 2022 06:43:04 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AF53C60461
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 06:43:03 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id g23so6047752qvb.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Feb 2022 22:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/stH23Hd713noUbpWZEuqV9fgGYPqRBV+0GvQx2oJE=;
 b=jSnUhTnaZLUhWDmTP4OFD270qb1CTyawo5JyEQmKQUr9vH/u3B4IQTY4n3SbuI6/S+
 /bVKBojeW4/1i1+ioAzW3FVT7oilM5vZ8NEBr9C89OX5yKvgeOq02+aZS8nOAWjjjf+/
 DygoDPRfa3fmXvAacKvWqM8cYSreBykIZhdspXjqqU1G7HyQBZvt3Ab831vgl+2TReA4
 l9+QSQg7od5hIPTUwHOwpsqv9vtvDrTEWjis9M2s+zeTm2lPxn6A3Tq5oCOik5VZEw6g
 ihf5ywoEPeD7jmYEOWJXL9VU/dysfCMrRS7oh07YEuCsZKFGUTvn3uoIiOvFVn54V+V5
 xgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/stH23Hd713noUbpWZEuqV9fgGYPqRBV+0GvQx2oJE=;
 b=nqcV0lEGrYEQ0XjEuEfGy9JBU+c/EgQQtH9lqD2JBTcjy+BDy3vT3M+DRkAdJbHhMG
 9qVtvEMlIJ9BvM0W6y2y1nv9JDGIrYh5uCxjCBIJUBtzTY9lXD57MHtUHg3A5hftxBJH
 287Mr8GhUZfNqZw3l7yGRTQWXUcUvSNxrLrBM2ltTEpGlC6rZyr98jmWUlh6ktoaA07u
 FboO4El8CejU1PHFlL6ebHSno1tO64sPQrXL5RPPbm9h05Gitt8M9cIEsbvhNvuU9OQ+
 /Vq06CUBGNZPMsOJyl29cYVuIyGaTYWg4IUpUsEjwQl2rqjZcLbyBRxfaDpSKJtavzlR
 +CkA==
X-Gm-Message-State: AOAM530qnxyX40VcpZ0gzB8o29APSPUAuhpUPQ6XFSlrTXjk8y9Nnw2k
 Ih4PWYohQeoy/EQyUJ5IH2Y=
X-Google-Smtp-Source: ABdhPJzusSVaflD2O3QIOvCGI0gZfanZ5bZX0fKR76AvPA5UDp6g4gRCoOO6YLf2vr7j5zq2YBVngA==
X-Received: by 2002:a0c:be89:0:b0:42c:35f0:3f39 with SMTP id
 n9-20020a0cbe89000000b0042c35f03f39mr4706634qvi.106.1645771382089; 
 Thu, 24 Feb 2022 22:43:02 -0800 (PST)
Received: from godwin.fios-router.home
 (pool-108-18-137-133.washdc.fios.verizon.net. [108.18.137.133])
 by smtp.gmail.com with ESMTPSA id
 i128-20020a378686000000b00648ddd8a5c0sm830238qkd.100.2022.02.24.22.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 22:43:01 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
To: u-boot@lists.denx.de,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Fri, 25 Feb 2022 01:42:15 -0500
Message-Id: <164577131657.1465089.4710901136694686331.b4-ty@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
References: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tero Kristo <t-kristo@ti.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] cmd: clk: test the number of argument
	in setfreq command
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

On Mon, 31 Jan 2022 17:21:37 +0100, Patrick Delaunay wrote:
> Test the number of argument in setfreq command to avoid a crash when
> the command setfreq is called without argument:
> 
>   STM32MP> clk setfreq
>   data abort
>   pc : [<ddba3f18>]	   lr : [<ddba3f89>]
>   reloc pc : [<c018ff18>]	   lr : [<c018ff89>]
>   sp : dbaf45b8  ip : ddb1d859	 fp : 00000002
>   r10: dbb3fd80  r9 : dbb11e90	 r8 : ddbf38cc
>   r7 : ddb39725  r6 : 00000000	 r5 : 00000000  r4 : dbb3fd84
>   r3 : dbb3fd84  r2 : 0000000a	 r1 : dbaf45bc  r0 : 00000011
>   Flags: nzCv  IRQs off  FIQs off  Mode SVC_32 (T)
>   Code: 4dd3 1062 85a3 ddbd (7803) 2b30
>   Resetting CPU ...
> 
> [...]

Applied, thanks!

[1/4] cmd: clk: test the number of argument in setfreq command
      commit: 3386fb1e485da7f206488ed206a61ae811885d90
[2/4] cmd: clk: replace clk_lookup by uclass_get_device_by_name
      commit: afcc26140bc6bff7c23ce02dbba7882c97d2c14a
[3/4] cmd: clk: update result of do_clk_setfreq
      commit: 534859ac6b2fecb631457736e77e9d0df1e57616
[4/4] cmd: clk: fix long help message
      commit: 92a1bba85761e4dd5c0647c48048423bceef4749

Best regards,
-- 
Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
