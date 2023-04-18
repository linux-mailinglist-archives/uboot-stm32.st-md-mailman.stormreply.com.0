Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3816E6973
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 18:26:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CE6DC69065;
	Tue, 18 Apr 2023 16:26:42 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C0C2C69065
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 11:50:04 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-517ca8972c5so362398a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 04:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681818603; x=1684410603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNRGPwlFBFTskUCJ5fEEXD2+VNsPlma/G5sq64Yukxs=;
 b=cicE93P/yVVgRXoKQFioNf8J9ny3BxM1ytDUvL1p6yDvSgA0T/TVwgUDkJ4iy02kZ7
 dUoWvZfutDbWChgdcyaRvsXZe7RZgvGUZxvl9KmXiulN7Dhn0uzeyWXqxo4t1FsaW0nJ
 +kl0zVBv6pVnWi9vHf0pA2aMREEJAxY64uWZS04gVpgIN9UXY+Ng1BWKIFP97rrq1lPT
 inf9Xp79wWa7PuZthbGlZkjHT3KyTpXuC146NsXwmdzxHXUVBssV8Gumnb6yIZjnZAT/
 JaaxSXnoOYmY/WuQBeFbTt3uX7icYeu5yeKSjd6+W2SXeDfQ76phXMz1nRE0NXGjuNdo
 uDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818603; x=1684410603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNRGPwlFBFTskUCJ5fEEXD2+VNsPlma/G5sq64Yukxs=;
 b=PZlxiRXGQ8lOi93FueKIbGtBOPx6NLvfVxH365rOYBjk8GStcb6x96TEmASloQhDZv
 BmFqN/QWfevHHI8g6jvBuSO3e23c0kSK77gLpr4o9WWsA8sgW3EdoJlbheJmmgzNS9cB
 d5FjtgahsMqheWTHKKAcQfeYoKQpnluWyv9gThu5sqs598d5HEP4ym5Iqj2Ec2mqD/2+
 K8h4rFADZZU/ov2LloQeBX9CwEWrSDlaO7+j5O2r+WGqsFwTHXipB2hgOVkK5M2Xqo0G
 S2ZUOgha+N+quNfXHC0YLJXbulHBcd0pgwe8wRAdvDQi2v/oFo9/hQfLaDMyQeRnmvzd
 emgA==
X-Gm-Message-State: AAQBX9cLTmcBuk8el4iChyCybXbtq9TrfPhbG+rd9p8ydwHMWfiYFZyc
 /u7av3r+pJCSwbZZHyUBb9DLqE9XgsOUCPqWN3aSwmeNs0U=
X-Google-Smtp-Source: AKy350Y1GB3ClffrWCudHLzTJeuLgS2BiC3FLZOuvtVaxsFyIVyqatfPU08tUFu1CJvz1qxc5wgbEdGUgygFaPM23Oc=
X-Received: by 2002:a17:90a:1cc:b0:247:2baf:d6f with SMTP id
 12-20020a17090a01cc00b002472baf0d6fmr13208457pjd.0.1681818602795; Tue, 18 Apr
 2023 04:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
 <d3e391f5-ce85-e5f9-41e4-81e271db8deb@denx.de>
 <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
In-Reply-To: <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 18 Apr 2023 08:49:51 -0300
Message-ID: <CAOMZO5DywMdsqdVc_0gF7ADtgT7R2OCfVqW2nTjDMabFqy-SmA@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
X-Mailman-Approved-At: Tue, 18 Apr 2023 16:26:41 +0000
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: onboard-hub: Don't disable regulator
	in remove() callback
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljZSBhbmQgTWFyZWssCgpPbiBUdWUsIEFwciAxOCwgMjAyMyBhdCA0OjIy4oCvQU0g
UGF0cmljZSBDSE9UQVJECjxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgoKPiA+
IElzbid0IHRoZSByZWd1bGF0b3IgZW5hYmxlL2Rpc2FibGUgcmVmY291bnRlZCA/Cj4KPiBUaGVy
ZSBpcyBubyByZWZjb3VudCBvbiByZWd1bGF0b3IgdGhhdCdzIHdoeSB3ZSBsZXQgcmVndWxhdG9y
IGVuYWJsZS4KClRoZXJlIGlzIGEgcmVjZW50IHBhdGNoIGZyb20gRXVnZW4gdGhhdCBhZGRzIHJl
Z3VsYXRvciByZWZjb3VudCBzdXBwb3J0OgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290
LzIwMjMwMzMxMDkxNTQ5LjE0OTA5NS0xLWV1Z2VuLmhyaXN0ZXZAY29sbGFib3JhLmNvbS8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK
