Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBEC32842
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 19:07:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FE84C62ED5;
	Tue,  4 Nov 2025 18:07:01 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F276EC030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 18:06:59 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-594285c6509so2771838e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279619; x=1762884419;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yhcuVcOcqBwHT2k5bEsxRtMQ4Fl1DU/3V8Ep4Szdhs=;
 b=Ou0r/0bSXGrNlKKjXcoZfHsuK16rcRhIVKhvQHwJci+rDAzZMLjapkK9MGgGfynGl2
 UfVuUf5Eps5yRhGuRIjItstlOubN8YQiZMVcIw7d1Z9QSxZnvO2AaQM/MNP33v5lKG22
 R+9o3U5Vmw6p9rlA5dsGLm6B0MQyR5tzRJI8UYkJ9tX2S46cipzGhTJ85T1JYG0bBANp
 JkbbQ+KFO6AOmhVUhLequOalXdk674izDOM58dRwTrRR6GLxH2Dm+SDOWjh9+d3Kyk3e
 E+In0NPG+KhonWuji3bTvoj9GPuCtMJM27C6rUJEH3BvgbZtaBVy8YJR0Kb2BuJsGVrC
 fX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279619; x=1762884419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+yhcuVcOcqBwHT2k5bEsxRtMQ4Fl1DU/3V8Ep4Szdhs=;
 b=bcQwM9TX3jeCavaoFkxg/RZhp3DGqvHLz+dMitEf97iQderpIAomevZCu7K84vVo2j
 xRTUR7ymV8Xs+RxGRW28gT1kDh7f9Ae9urIinVkvvmQYhAX9VpRGV4zVYiggRQcDmuwq
 fm1Jif+miUFAOTuerOKMZIu1zhFzU3vHG4hHaAo/ac3pikafV7nYXhLVSJp9pc42uZH4
 WI8QNGN10UXr2jV0lcpe7Kp3b18qVMDkr7zQv22q3mmmMEaWiEKeARFAvlKCKWsJjHen
 1gg3a4Lr33cDGggMKKcrpZiMlrTRJotVBNQHYI5oA/jJPo5k2zViNoX8eEIKOOPoRoma
 Vyiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNyhK9U6jYgaax7YhhC+ZQ5r4DaY/iOAbA5ed3il1HME/ENa3PYfC6lYADBfmYSovPmWLyb9WKqgjQsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwBiib0l9bHMiECFF2UK4k15f/101XDb/H6Yjavj9tqXskCeIPg
 9ywbCoGktZfyWQpoEEV7HXmfUArLCfpvr5FQhj/eAv+Y8F67Xqdi/c/1ON1Hfh9cWxQ66LHjath
 4JAWvRQ8XkpbD6Ryh1jEPJgAEmlA543Y=
X-Gm-Gg: ASbGncvIavgzJ3Djr3e740le/8ThZPaS25i2XyzYRU7KHrmx6R0Tg3JjNkorF9Uh7BN
 428GzN9gjDe3rDA1CvTKS/+ztKyBMcqbPe4VhIdvEoF0NupDIZCmMvUSWaR7jvp2m1AJYTcGeK+
 UQt8VLNYpicWERx0UDFJyeiTqAceK54X1hD+3sJwheJLzZt31ZQGe+Dm3uJnu8QzJk8geVOCH+A
 Hu/2Z9bzDvt9RRsOS9q7p418TTWFHYVnCuPS3MyoIP9H/r+Q8cekEFzzXxR/BViOVIn8rNtDjoH
 hwLQDAOQg6OcBvZU
X-Google-Smtp-Source: AGHT+IF8c0wjtHWI5yzusC/jRNgesfvLnfcyAFgTAt/dnmz+F+dVVdaXA80EqBzK4kI5znOnc+bjkS5Fxvi5t4QH4ek=
X-Received: by 2002:a05:6512:3d08:b0:594:27ab:2f7a with SMTP id
 2adb3069b0e04-5943d5176bemr29529e87.0.1762279618895; Tue, 04 Nov 2025
 10:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Nov 2025 15:06:46 -0300
X-Gm-Features: AWmQ_bmE8qz0k-cxLvcNyl2QpLF7kO7f8XjGvWLUGc9akpJJlJNd3_GLyN7Xn_k
Message-ID: <CAOMZO5DJqtqG8GTAoHsHVewr2i4dfVcHH0o3OJRu9o3+ocmYmg@mail.gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Tom Rini <trini@konsulko.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>, u-boot@lists.denx.de,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Hari Nagalla <hnagalla@ti.com>,
 Ryan Eatmon <reatmon@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH v4 00/12] remoteproc: Add support for
	i.MX8M[M/N/P/Q] and i.MX93
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

T24gVHVlLCBOb3YgNCwgMjAyNSBhdCA3OjA24oCvQU0gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5j
b20+IHdyb3RlOgo+Cj4gVjQgcGF0Y2hzZXQgcGFzcyBDSToKPiBodHRwczovL3NvdXJjZS5kZW54
LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1tbWMvLS9waXBlbGluZXMvMjgxMzcKCkFwcGxp
ZWQgdGhlIHNlcmllcywgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
