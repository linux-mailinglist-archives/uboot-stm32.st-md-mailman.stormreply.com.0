Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82210A84DF9
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Apr 2025 22:14:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36F01C78F80;
	Thu, 10 Apr 2025 20:14:26 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C8A3C7802F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 20:14:24 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2cc89c59cc0so1351542fac.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1744316063; x=1744920863;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HbH/WhBwPxF2uyy+3apDTm15xCiNuUP4SeiP4yYpl0=;
 b=LO5Ee9NfDqeTUo6s4V5yDcIULFzbFrS/QHfKUDfQ6CmN+PFUv4+19laDX7V6Lry5ft
 FugLsOmXq+v4TAbX+paqAwLz9W8gzWt8DYcrUeJONIBjzF/b25WsSGnVVnJeD4g7rplL
 mbAOxn1gxKPgcaai/5BJ724GQQOGP9qVFLdc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744316063; x=1744920863;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HbH/WhBwPxF2uyy+3apDTm15xCiNuUP4SeiP4yYpl0=;
 b=TxtxDWTQmi4LzKMuI4u/9lsTTxm8DxUHjgGALev1Ue6IrMUSrbBR6B7wfumdsPrHn4
 GTkgcTXkIrbP+4mjReUzS4MO8U7etrsYyGvuVIXp8ymAZK5KEE2u6DAOecagRKN8lsEn
 mdfFW7CUiZ2bqCFayO0wdSxMOq+oNMMsZJtK0NSK3XBbX3GGSh1AaC+B+UjiVA333QlL
 99GSt8l0wka4uaZw8Oxb+2qQRuVUDUOq4dilwuuppDIFYWie+7D+cUAA345T1aH1Sj0i
 0/2KMWkEYOv9afod4oI5kxDoih8QoPukdxBCqwFQfTkJg/qDoERGhNAt9FZuAVYNglfY
 7LHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtoN1FWvWTM7NHqyOgvBXtiETJZuSk+zhRqyxV6fEmyD4D6JiADDv0XmROg/jkMFrgtAukokugut+3/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyasFq1OjEJJEK2yAyGiG9hzDF6f7WT2xcSKcU/ke0ICOpRjuVK
 5JfDq8gwAkrniuQpfmLh7yATbycUDmfcZPtYcYQyZAN9CcuRk8CgnTKcAMS/YMc=
X-Gm-Gg: ASbGnctyYrspAzVAeTXTKyVfmpIj31SqVmvRA+117SNnYNNITDbQTw1ICfW6G+x12eD
 JBOOsT3K1Iz8jgv1QESBofvKeoIAsJXjrXr6lIlGfe4E1TTnCbXcraT6iphvcqB9NkZMYuVpPc3
 1JljpJNuFq/xr/QNldT2X+u472Z/ywacxvSksoinkFRIH+x4kIYQHi/z05/offnV4A3wp+7XwQt
 FqXk+ClEiXYdpobtT6quT/1XlJnAsXoSaxsgAm8Kub34TkSuJ9HncffhaNpZ+Z/+Oog24CHxOYR
 bIZxSUDZaXh2++IRcA4ajRQ1zIGRd1QkE6QX/DYmPmPvEYe0QQ1CjW6FkVOKipWi6OTWx2V21Db
 Z6Kvp6wJl4p0=
X-Google-Smtp-Source: AGHT+IHHPz8nMwsExmn55DUZOFqToxI7YQNTIbZy251OhdFNv39Esct+7ogTv2ErwwXfjDXue2Yjrg==
X-Received: by 2002:a05:6870:b9c3:b0:2c1:f878:410d with SMTP id
 586e51a60fabf-2d0d39091camr179641fac.14.1744316063317; 
 Thu, 10 Apr 2025 13:14:23 -0700 (PDT)
Received: from [127.0.1.1] (fixed-187-190-205-42.totalplay.net.
 [187.190.205.42]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72e73d8fcaasm685741a34.38.2025.04.10.13.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 13:14:22 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250328163115.642347-1-patrice.chotard@foss.st.com>
References: <20250328163115.642347-1-patrice.chotard@foss.st.com>
Message-Id: <174431606229.2981499.11634647631324777304.b4-ty@konsulko.com>
Date: Thu, 10 Apr 2025 14:14:22 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [Uboot-stm32] [PATCH] dtc: introduce label relative path
	references
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

On Fri, 28 Mar 2025 17:31:15 +0100, Patrice Chotard wrote:

> Since introduction of OF_UPSTREAM flag, U-Boot's dtc must be able
> to compile Kernel's device tree.
> 
> Since kernel commit 7de129f5389b ("ARM: dts: stm32: stm32mp151a-prtt1l:
> Fix QSPI configuration"), label relative path references has been
> introduced. These label relative path references is not supported
> by current U-Boot dtc version 1.5.0: (see mailing list discussion [1]).
> 
> [...]

Applied to u-boot/master, thanks!

[1/1] dtc: introduce label relative path references
      commit: 088bbc1efa8c1efe8e2714b9640055ce984aec93
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
