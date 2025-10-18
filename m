Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D94BED101
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Oct 2025 16:07:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ADE6C5A4C9;
	Sat, 18 Oct 2025 14:07:29 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12963C5A4C7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 14:07:27 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-443afb2334bso677806b6e.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1760796447; x=1761401247;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3S76BXPXEcqXUBK4d+xUovYMaaIg1Frx7cJy6Mbk3k8=;
 b=rTS6m8lMOMSpjWm4i6+0lzmOm8STO2G7/dmw37yim/cpddeoIsu6b0Tr3m9FKPzGjl
 sEkmkMOhekBenHQtjqz8r1TA9crjzHpH0HBiBtYBdggCL4PqImyW+1laXbq92gsS6scB
 +x6V1bmcAiPj5NNFuNsgow9LLv5dteOi0OGgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760796447; x=1761401247;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3S76BXPXEcqXUBK4d+xUovYMaaIg1Frx7cJy6Mbk3k8=;
 b=Rb76dP1bSYHOdxczMQQq4F07p3MLSII0M6vKMcE0yqKpzkL6K0BQU6EbU8AEJpU7Gj
 55bhspGMusNYqDZ9XRiB1+dFtH3hNyPdseR4ZD+8YnJ/MsyeF9NbNAPrbWe7/QQfYhWN
 G2zulua1AupFrq0urwHWAInjhvie/upCHqkp7dIA+mwFnoXxoxes9DDteg524V63sDym
 JFi9DNxi6/fphXMc/Z5dAYZkHx6g2y+3HddYW2h9/VWxlZ3ZI70yJzAcR/Z6PHJdd5Ih
 R2zEKd//YK0Huonl3wn9iJF+xBPzSdrj0udiHz5vbFuKmOosy1yLiryqZgGVm8586Fk3
 Tu/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTBnXQYE7NkHgCNq7b/bRg6Pcc8SlTXKUoNbGdxh3SV478GzXAmCZ6cc9HTPw7hkVVVnuqagd4+08roQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxhY7XJidyaw62JcYowrbSCoXnYCBjfgLY+1hc+vLfWo4YM5rgY
 KOTUtIYjeVJ4qcvhJ4eDno+HrDeR6Q/3DMyCV3zhsYn+0ldxGFaTp7c+qMAGYeqnAN1yishcv6N
 6hPROIcA=
X-Gm-Gg: ASbGnctH8Rv7G/KQD6xD58LVskt0c+rFLJYncehX5vxn+uKPl7H7XCs2qyMPHHWxL5c
 Hm7UFU/XRleWUV7d9Hz/XLZgK1KEeRPcOOV5b+3CZ1n04yWr3p3VQhP0iaVl1v4rcBew+1Whfdq
 PgVYg0vZyvWM3haOi+HqtCXaOKghywLG1VihPffIcwtKNzPXqgUN+XLVDBdksSiOB3Z+RHWmo34
 PbpM9INpjEuv5lKptnqtDDkHHis6gpulfEtxun/rS7myiRPTqccK4dUlTTF6m8blPtmU9RnTz82
 RciYwCz4ik05rafGv5/1orl4dBqkh+SCu3O45CnfYwDFde1bmuu+qCdbRrJS1X7MN/CAl5RWaoI
 L3VHWQ12dTsWU8XbBn3qpr9EALvTNhArvozFKTmYU1bOKo3/VQK9X2dCunPpKUUXCDmLLTJP9wM
 udN54qDQKg5XkTgatQTK72A7ya9gYVY1tNZkkaciIGxmhrZGW5
X-Google-Smtp-Source: AGHT+IFxfvLDi0NUQg7Z7FkE0LQStzCjwdjRrsNdRBOlUGxC0vXgTLQBWAmPEjFU7u4axXYMADHeCw==
X-Received: by 2002:a05:6808:181e:b0:438:430b:3dce with SMTP id
 5614622812f47-443a2dfa130mr3174007b6e.10.1760796446815; 
 Sat, 18 Oct 2025 07:07:26 -0700 (PDT)
Received: from [127.0.1.1] (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-651d3f2fa57sm618972eaf.14.2025.10.18.07.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 07:07:25 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20251009130844.11703-1-patrice.chotard@foss.st.com>
References: <20251009130844.11703-1-patrice.chotard@foss.st.com>
Message-Id: <176079644510.1878470.6565620492889693742.b4-ty@konsulko.com>
Date: Sat, 18 Oct 2025 08:07:25 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Heiko Schocher <hs@nabladev.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v1 0/2] led: fixes
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

On Thu, 09 Oct 2025 15:08:32 +0200, Patrice Chotard wrote:

>   - Update led_get_by_label()
>   - Fix led Kconfig
> 
> Patrice Chotard (2):
>   led: Update led_get_by_label()
>   led: Add LED dependency for LED_ACTIVITY and LED_BOOT
> 
> [...]

Applied to u-boot/master, thanks!

[1/2] led: Update led_get_by_label()
      commit: d9915318b5d8dd9c31209541c1d99ab0edb339ac
[2/2] led: Add LED dependency for LED_ACTIVITY and LED_BOOT
      commit: 827ccb84ff433001b59168d81a59489e339ec2c0
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
