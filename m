Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3905C0A6BA
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Oct 2025 12:29:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 848FBC5F1F9;
	Sun, 26 Oct 2025 11:29:04 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0A9DC5A4DB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Oct 2025 11:29:03 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-36a448c8aa2so29805261fa.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Oct 2025 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761478143; x=1762082943;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ynTadvmvoc4pSoY0OewF8in8Z1Yuq8/00xoZUqgg8e4=;
 b=lS2yC1pWgqCeVL73vyMzizcLtR6xrkc82ZowOcIzDn/6eAc16BamtL39giNvxwfAhz
 Atn+n/lIH3ytXjfz3iFkeKgI8D3ZPpwiZUK3GjGSLWGta8Qu3zuqEFcchrC4fsBSvqHk
 6FN1DnQXz11ZfHyONlqVgWm4NaD2WCd0qjHY7Vb8HGVj10idP0UHXP8rrjs407xssjEH
 3nx0/huE19c55yEklZV/c2jtC10d8DTFq6m6wHwbEFlJC5pLVzOYwSz4T/4TC9erl1Ah
 Rvii7IF5VU7OtvWNiLq/nFJDxvwHs57hO2+dh9FxL13ryababd1Mp9Jm/VeSWW08QFCr
 tQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761478143; x=1762082943;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynTadvmvoc4pSoY0OewF8in8Z1Yuq8/00xoZUqgg8e4=;
 b=OFOQOpizuCFlbi4PTBbQlTIQXjfNixuFpKpQxhk3w2JM8527Qpp3isceKEMmvpVCab
 piOLzPyIgRJsv7lUTTjCiAkYiBeHD4s0ZHgMrWUtGEQu5fpX4n+P8DjGm+fQGI20zlT+
 Ia+m0Xaux/b1WxejlfvsbiWOZYgqAvntTCS2nOfHYSJsSJx1BymZFSBAHnV0i72Ixj/q
 FvtB/ZBB19P90rOPzziRMfCNMoAFK2TURJ6Farcr0x7TbLZQtfwBROd6HASNc26jvGo4
 DGOj7x1mFKSNVBTUybklaCnldvStb8NUtgbz93lT1H2J5WPQI0UESTg7uauq/x4Bk3qT
 uPNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkWc/sInAt06rTYefG3NX/uA4pq7UHas6NR7nCe1rbA+o+yrjhQxfM1oZTwWif7QaBoKfZ3phA1a3Vhg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyA0I6T4I+0HSWzYTHfQM18e2hCP9YVPsyAd7ECf7MVB2GB0N8i
 HwSEnrrCsQOzlDM/2t21QSiezh0ZAIw3gOiN0p1rzPbTfz0v6QpR7nWIuLFsCzIhg6ugxHsWq3J
 jb7aMWfDxRc5SGBFSMiWg6awTDeZR4I8=
X-Gm-Gg: ASbGnctEohV+qgAFKhRurSBXvgbEziNA+kfkC1zlAILORjdnVv/gvP+NdWVf8hcomcd
 5A/8qDV5Mzdrj2OAQNg7nNaexrrlL62Sq6C7cuSEZTlcmF0eKbyCdBBHtmdmAADITouqyERQy8V
 G19nPysZW/6swhNclEzPl4p4OOjEXCbqH9/yg13IGpMzbdwOeYoddotEZQLvt79fU4Mv7IdTtS6
 ULT4TAHVPFrE4n5Zff4Py8wpfleJc4H3wU4PZOxshv6xN41RqwcgPaE2w51fsqOmJMjlfEN5hBY
 Oa/elbq9oYguF4Jz6EdE2CFnbdg=
X-Google-Smtp-Source: AGHT+IFLKKqmGQ3wE2zzJi6BFxHhDNwCUT0PKVJBwtSnM7rSh6lKQ2j3j5s2gHDX5QVIdMU0dMLp8iU/lF+HZ1MaswE=
X-Received: by 2002:a05:651c:b06:b0:378:d63b:9d29 with SMTP id
 38308e7fff4ca-378e43d6654mr23250731fa.47.1761478142486; Sun, 26 Oct 2025
 04:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 26 Oct 2025 08:28:50 -0300
X-Gm-Features: AWmQ_bmmMbRvPogXPfX7up5DAniUNizY89HBxZuZ3MVwTIKDOuuzingVzpb60Ec
Message-ID: <CAOMZO5ASxBCdTQFfoUA7k5aXKwQZS+MC75kHw7uHoHsF1AgbcQ@mail.gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Tom Rini <trini@konsulko.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, u-boot@lists.denx.de,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Hari Nagalla <hnagalla@ti.com>,
 Ryan Eatmon <reatmon@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/12] remoteproc: Add support for
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

SGkgUGVuZywKCk9uIFR1ZSwgT2N0IDIxLCAyMDI1IGF0IDk6NDjigK9QTSBQZW5nIEZhbiA8cGVu
Zy5mYW5AbnhwLmNvbT4gd3JvdGU6Cj4KPiBDSTogaHR0cHM6Ly9kZXYuYXp1cmUuY29tL3Blbmdm
YW4vdWJvb3QtY2kvX2J1aWxkL3Jlc3VsdHM/YnVpbGRJZD0yMQo+Cj4gVGhpcyBwYXRjaCBzZXJp
ZXMgaW50cm9kdWNlcyByZW1vdGVwcm9jIHN1cHBvcnQgZm9yIE5YUCBpLk1YOE0gYW5kIGkuTVg5
Mwo+IHBsYXRmb3Jtcy4gTW9zdCBvZiB0aGUgaS5NWC1zcGVjaWZpYyBsb2dpYyBpcyBwb3J0ZWQg
ZnJvbSB0aGUgTGludXgga2VybmVsIHRvCj4gZW5zdXJlIGNvbXBhdGliaWxpdHkgYW5kIG1haW50
YWluYWJpbGl0eS4KCkknbSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgdXRfZG1fZG1fdGVzdF9yZW1v
dGVwcm9jX2VsZiBlcnJvciBpbiBHaXRsYWIgQ0k6CgpodHRwczovL3NvdXJjZS5kZW54LmRlL3Ut
Ym9vdC9jdXN0b2RpYW5zL3UtYm9vdC1pbXgvLS9qb2JzLzEyNzQxNjgjTDI3NgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
