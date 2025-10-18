Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F9DBEDB71
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Oct 2025 22:11:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E92BCC5A4D4;
	Sat, 18 Oct 2025 20:11:05 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19F82C5A4CA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 20:11:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-579d7104c37so3903072e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760818264; x=1761423064;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DShVlhAlSL8goFK4b4vqmgBbJzrbAT7+mmIgfmzD2wg=;
 b=NgJt4Jn1uN7uKqnB9mjGyAI3vlEG0ovwrGAucqG5MXudvojZ5ho01rD+SEPcs8mdBC
 k0uxFVBb2UMGEefz7zufWfbIHOl2C+zG7+c91sVc3CmSvsMjWb4BagtgT7ZV+BXPHTDK
 j9ghHiArnXfr//r39gFtzACJWge9e/EJnWDnYepc8GOEo8S4+nLl+Brr/y2kPcFGPLr5
 I0C6nW8PLtM1+GP3jwj/4ii/mAxFBacrK1WrkWZhtl5uSTqCFvRwkDcNz+eRQ92cI8EE
 eZLPWmKRlLAwxfcPHjxZBRJbG0Q/KaRzgobeQowSorxe8qjuQWG72WT06yxlCoLZWOzf
 NTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760818264; x=1761423064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DShVlhAlSL8goFK4b4vqmgBbJzrbAT7+mmIgfmzD2wg=;
 b=f+eYMKpDA0F6JO4xlJww9Nr5aATWNfs5HL1Q5WET7WQfkpdLDKfMp/NkK8pBMjo1PS
 G1BLGS1Tz29N0fVVZ3BAEicEqoaDb2I360aaP0n2gs+vkslGXAJGLD2x7mgJ/Z/QUPpj
 4XjY3d7IDZgrs+Sqmx/S3Bq3f9nHTGIIX46/6Z0g0cEfRSbNfw/DGu7TkrjbFWSSNo19
 2/NwmHtOt+g18wUxZ57f5ftxRbJdyXRsExg3utmSrnb1NbiUyK5gnrAtxrOpULOHIj+M
 FU5VGZhpdTl+dp+/kbIZdOCR0MAmXD6aOTzpGw9R3GecX1vhs5Hb03BZzMHc17ZNxRdh
 2gKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEgvjcbtF0MzSHntHiWLP/Wng41sMuq41Mua/QqedT2odqiXQv+hTex3OE+GhHcEsRl8wa6YswjN/Abg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSwElUZyj2BA00aqdY97SA6b+Eatou/U8d5784JqcJVamUd7G+
 aJ/KENGc85O4RRFleJMaH6522PEysjuEIHicGFxiPyU3ZejCoK+GGAJo65iMwYoEXf88xFabsQj
 MECsi6uysd4gLTawjfZ4+SrtwZnRJniE=
X-Gm-Gg: ASbGncvJF/hfYPgoAfZ/e3dD/ZwNFZzpd0Jz3dnRLDn4JWtW2I/OztRoviy+Y+h3bsK
 OunCZQDdt7dzAfBQLfZIbcWI+aImaMDpAPohpir5vhLsr6vjnc3Grj85gMPyJcButO9CndY/rrB
 xgvc1mXP0XriXBQT21iWpZ6P6caAIKf8pGJUS72En7ih6fq29I5SRRqvEyJir5M6Cf9QVWVJl/7
 Q8rEgcOy6nw0JfMRM5p3cQHCF+ZwUn153YJ7054e0aAJCMyPaKj5niTrVA4Xdme5/t8YNxTv/f6
 DEahJ3Wct7WPDl0=
X-Google-Smtp-Source: AGHT+IHMa3MNNBTMYi9Ze8DLyppLOh5gYUznm1GtEpvnJunx5KkpdBPLNZI7STHDrOfEqzjcs27gTaEXgI+506fzR1I=
X-Received: by 2002:a05:6512:15a2:b0:591:c2b9:5be1 with SMTP id
 2adb3069b0e04-591d8557d6cmr2384864e87.33.1760818263846; Sat, 18 Oct 2025
 13:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
In-Reply-To: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 18 Oct 2025 17:10:52 -0300
X-Gm-Features: AS18NWCWlApI9WOQTnONPGtILLB5E9Ej6tYRUKXE2ESlGKzCYlvuNWY9kV1gk0o
Message-ID: <CAOMZO5B8cT0NPSAtu7pxODiy_=8PD_aYWW1U7+fs_xLJP8cKbQ@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Andrew Davis <afd@ti.com>,
 u-boot@lists.denx.de, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Hari Nagalla <hnagalla@ti.com>,
 Ryan Eatmon <reatmon@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/10] remoteproc: Add support for
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

SGkgUGVuZywKCk9uIFR1ZSwgT2N0IDE0LCAyMDI1IGF0IDExOjE44oCvUE0gUGVuZyBGYW4gKE9T
UykgPHBlbmcuZmFuQG9zcy5ueHAuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGlu
dHJvZHVjZXMgcmVtb3RlcHJvYyBzdXBwb3J0IGZvciBOWFAgaS5NWDhNIGFuZCBpLk1YOTMKPiBw
bGF0Zm9ybXMuIE1vc3Qgb2YgdGhlIGkuTVgtc3BlY2lmaWMgbG9naWMgaXMgcG9ydGVkIGZyb20g
dGhlIExpbnV4IGtlcm5lbCB0bwo+IGVuc3VyZSBjb21wYXRpYmlsaXR5IGFuZCBtYWludGFpbmFi
aWxpdHkuCj4KPiBUaGUgZXhpc3RpbmcgYm9vdGF1eCBjb21tYW5kIGluIFUtQm9vdCBvbmx5IHN1
cHBvcnRzIGxvYWRpbmcgcmF3IGJpbmFyeSBpbWFnZXMuCj4gSG93ZXZlciwgdGhpcyBhcHByb2Fj
aCBmYWlscyB3aGVuIHRoZSByZW1vdGUgcHJvY2Vzc29yIGZpcm13YXJlIGNvbnRhaW5zCj4gc2Vj
dGlvbnMgdGhhdCBtdXN0IGJlIGxvYWRlZCBpbnRvIGJvdGggVENNIGFuZCBERFIuIFRvIGFkZHJl
c3MgdGhpcyBsaW1pdGF0aW9uLAo+IG5lZWQgdG8gdXNlIHJlbW90ZXByb2MgZnJhbWV3b3JrIEVM
RiBsb2FkZXIsIGVuYWJsaW5nIHByb3BlciBsb2FkaW5nIG9mCj4gc2VnbWVudGVkIGZpcm13YXJl
IGltYWdlcy4KPgo+IFBhdGNoIFN1bW1hcnk6Cj4KPiBQYXRjaGVzIDHigJMyOiBJbXBvcnQgbWVt
Y3B5X2lvIGFuZCBtZW1zZXRfaW8gZnJvbSB0aGUgTGludXgga2VybmVsIGFuZCBlbmFibGUKPiAg
ICAgICAgICAgICAgdGhlbSBpbiB0aGUgcmVtb3RlcHJvYyBzdWJzeXN0ZW0uCj4gUGF0Y2hlcyAz
4oCTMTE6IEFkZCBwbGF0Zm9ybS1zcGVjaWZpYyByZW1vdGVwcm9jIHN1cHBvcnQgZm9yIGkuTVg4
TSBhbmQgaS5NWDkzLgo+IFBhdGNoIDY6IFRlbXBvcmFyaWx5IGFkZHMgQ29ydGV4LU0gbm9kZXMg
dG8geC11LWJvb3QuZHRzaSBzaW5jZSB0aGV5IGFyZSBub3QKPiAgICAgICAgICB5ZXQgYXZhaWxh
YmxlIGluIHRoZSB1cHN0cmVhbSBMaW51eCBkZXZpY2UgdHJlZS4gVGhlc2Ugbm9kZXMgY2FuIGJl
Cj4gICAgICAgICAgcmVtb3ZlZCBvbmNlIHRoZXkgYXJlIG1lcmdlZCB1cHN0cmVhbS4KPgo+IE5Y
UCBpbnRlcm5hbCBSLWIgdGFncyBhcmUga2VwdCwgYmVjYXVzZSB0aGUgcGF0Y2hlcyBhcmUgZGly
ZWN0bHkKPiBjaGVycnktcGlja2VkIGZyb20gTlhQIExUUyB0cmVlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+CgpQbGVhc2UgYWRkIGRvY3VtZW50YXRpb24g
dGhhdCBleHBsYWlucyBob3cgcmVtb3RlcHJvYyBjYW4gYmUgdXNlZCBvbgpOWFAgaS5NWDhNIGFu
ZCBpLk1YOTMgcGxhdGZvcm1zLgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
