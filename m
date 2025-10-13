Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EBCBD5A15
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Oct 2025 20:02:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82B27C32EB0;
	Mon, 13 Oct 2025 18:02:59 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 799E3C349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 18:02:57 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DI2ZgU1400267;
 Mon, 13 Oct 2025 13:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760378555;
 bh=gNxuHoxRsc7GYkqIxDHrk2jZFbS3La1oF/94kWkw46o=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=vwwU6xTAKSc1dueCSBbeniFNNtcdmnjdgstRvvuLxEhQfTC2pd3b38dAiToI1f3YF
 MxSi9eAePM1iv+8pCtotXG9VwtyKTfC6CQRJuFi0Bdu2geX03NRjS3VMyTgXB9fUXb
 V/bgc7mNITIyB05fV22nxILbbseX8raa8QIHEVTw=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DI2YPc3141828
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Oct 2025 13:02:34 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 13:02:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 13:02:34 -0500
Received: from [10.250.148.111] ([10.250.148.111])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DI2H0e2241867;
 Mon, 13 Oct 2025 13:02:21 -0500
Message-ID: <8be42ffa-c2fc-4954-bcee-3baddb50a7d9@ti.com>
Date: Mon, 13 Oct 2025 23:32:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>, "NXP i.MX U-Boot Team"
 <uboot-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>, Stefano Babic
 <sbabic@nabladev.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 00/11] remoteproc: Add support for
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDEwLzEzLzIwMjUgODoxOSBBTSwgUGVuZyBGYW4gKE9TUykgd3JvdGU6Cj4gVGhpcyBwYXRj
aCBzZXJpZXMgaW50cm9kdWNlcyByZW1vdGVwcm9jIHN1cHBvcnQgZm9yIE5YUCBpLk1YOE0gYW5k
IGkuTVg5Mwo+IHBsYXRmb3Jtcy4gTW9zdCBvZiB0aGUgaS5NWC1zcGVjaWZpYyBsb2dpYyBpcyBw
b3J0ZWQgZnJvbSB0aGUgTGludXgga2VybmVsIHRvCj4gZW5zdXJlIGNvbXBhdGliaWxpdHkgYW5k
IG1haW50YWluYWJpbGl0eS4KPgo+IFRoZSBleGlzdGluZyBib290YXV4IGNvbW1hbmQgaW4gVS1C
b290IG9ubHkgc3VwcG9ydHMgbG9hZGluZyByYXcgYmluYXJ5IGltYWdlcy4KPiBIb3dldmVyLCB0
aGlzIGFwcHJvYWNoIGZhaWxzIHdoZW4gdGhlIHJlbW90ZSBwcm9jZXNzb3IgZmlybXdhcmUgY29u
dGFpbnMKPiBzZWN0aW9ucyB0aGF0IG11c3QgYmUgbG9hZGVkIGludG8gYm90aCBUQ00gYW5kIERE
Ui4gVG8gYWRkcmVzcyB0aGlzIGxpbWl0YXRpb24sCj4gbmVlZCB0byB1c2UgcmVtb3RlcHJvYyBm
cmFtZXdvcmsgRUxGIGxvYWRlciwgZW5hYmxpbmcgcHJvcGVyIGxvYWRpbmcgb2YKPiBzZWdtZW50
ZWQgZmlybXdhcmUgaW1hZ2VzLgo+Cj4gUGF0Y2ggU3VtbWFyeToKPgo+IFBhdGNoZXMgMeKAkzI6
IEltcG9ydCBtZW1jcHlfaW8gYW5kIG1lbXNldF9pbyBmcm9tIHRoZSBMaW51eCBrZXJuZWwgYW5k
IGVuYWJsZQo+ICAgICAgICAgICAgICAgdGhlbSBpbiB0aGUgcmVtb3RlcHJvYyBzdWJzeXN0ZW0u
Cgp3aGljaCBDUFUgYXJjaCwgeW91IGFyZSB1c2luZy4gSSBhc3N1bWUgdGhpcyBpcyBBUk0tNjQg
dGhlbiBJIHNlZSAKYWxyZWFkeSBkZWZpbmVkIGluCgpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS91LWJvb3QvdjIwMjUuMTAvc291cmNlL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lvLmgjTDQ3MSAK
CgoKPiBQYXRjaGVzIDPigJMxMTogQWRkIHBsYXRmb3JtLXNwZWNpZmljIHJlbW90ZXByb2Mgc3Vw
cG9ydCBmb3IgaS5NWDhNIGFuZCBpLk1YOTMuCj4gUGF0Y2ggNjogVGVtcG9yYXJpbHkgYWRkcyBD
b3J0ZXgtTSBub2RlcyB0byB4LXUtYm9vdC5kdHNpIHNpbmNlIHRoZXkgYXJlIG5vdAo+ICAgICAg
ICAgICB5ZXQgYXZhaWxhYmxlIGluIHRoZSB1cHN0cmVhbSBMaW51eCBkZXZpY2UgdHJlZS4gVGhl
c2Ugbm9kZXMgY2FuIGJlCj4gCSByZW1vdmVkIG9uY2UgdGhleSBhcmUgbWVyZ2VkIHVwc3RyZWFt
Lgo+Cj4gTlhQIGludGVybmFsIFItYiB0YWdzIGFyZSBrZXB0LCBiZWNhdXNlIHRoZSBwYXRjaGVz
IGFyZSBkaXJlY3RseQo+IGNoZXJyeS1waWNrZWQgZnJvbSBOWFAgTFRTIHRyZWUuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KPiAtLS0KPiBQZW5nIEZhbiAo
MTEpOgo+ICAgICAgICBsaWI6IEltcG9ydCBpb21lbV9jb3B5IGZyb20gTGludXggS2VybmVsCj4g
ICAgICAgIHJlbW90ZXByb2M6IEV4dGVuZCBkZXZpY2VfdG9fdmlydCB3aXRoIGEgaXNfaW9tZW0g
cGFyYW1ldGVyCj4gICAgICAgIHJlbW90ZXByb2M6IEFkZCBpbXhfcnByb2MgZHJpdmVyIHRvIHN1
cHBvcnQgTlhQIGkuTVg4TVAvTgo+ICAgICAgICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IFN1cHBv
cnQgaS5NWDhNUS9NCj4gICAgICAgIHJlbW90ZXByb2M6IGlteF9ycHJvYzogQWRkIHN1cHBvcnQg
Zm9yIGkuTVg5MyBDTTMzCj4gICAgICAgIGFybTogZHRzOiBpbXg4bTogQWRkIHJlbW90ZXByb2Mg
bm9kZQo+ICAgICAgICBpbXg4bXA6IEVuYWJsZSByZW1vdGVwcm9jIGZvciBpLk1YOE1QIEVWSwo+
ICAgICAgICBpbXg4bW06IEVuYWJsZSByZW1vdGVwcm9jIGZvciBpLk1YOE1NIEVWSwo+ICAgICAg
ICBpbXg4bW46IEVuYWJsZSByZW1vdGVwcm9jIGZvciBpLk1YOE1OIEVWSwo+ICAgICAgICBpbXg4
bXE6IEVuYWJsZSByZW1vdGVwcm9jIGZvciBpLk1YOE1RIEVWSwo+ICAgICAgICBpbXg5MzogRW5h
YmxlIHJlbW90ZXByb2MgZm9yIGkuTVg5My1FVksvUVNCL0ZSRE0KPgo+ICAgTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICBhcmNoL2FybS9kdHMvaW14OG1t
LXUtYm9vdC5kdHNpICAgICAgIHwgICA0ICsKPiAgIGFyY2gvYXJtL2R0cy9pbXg4bW4tdS1ib290
LmR0c2kgICAgICAgfCAgIDQgKwo+ICAgYXJjaC9hcm0vZHRzL2lteDhtcC11LWJvb3QuZHRzaSAg
ICAgICB8ICAgNCArCj4gICBhcmNoL2FybS9kdHMvaW14OG1xLXUtYm9vdC5kdHNpICAgICAgIHwg
ICA0ICsKPiAgIGFyY2gvYXJtL21hY2gtaW14L2lteDhtL0tjb25maWcgICAgICAgfCAgMjAgKysK
PiAgIGFyY2gvYXJtL21hY2gtaW14L2lteDkvS2NvbmZpZyAgICAgICAgfCAgMTIgKysKPiAgIGRy
aXZlcnMvcmVtb3RlcHJvYy9LY29uZmlnICAgICAgICAgICAgfCAgIDcgKwo+ICAgZHJpdmVycy9y
ZW1vdGVwcm9jL01ha2VmaWxlICAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL3JlbW90ZXBy
b2MvaW14X3Jwcm9jLmMgICAgICAgIHwgMzcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuaCAgICAgICAgfCAgNTYgKysr
KysKPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9yZW5lc2FzX2FwbXUuYyAgICAgfCAgIDMgKy0KPiAg
IGRyaXZlcnMvcmVtb3RlcHJvYy9ycHJvYy1lbGYtbG9hZGVyLmMgfCAgOTMgKysrKysrLS0tCj4g
ICBkcml2ZXJzL3JlbW90ZXByb2Mvc2FuZGJveF90ZXN0cHJvYy5jIHwgICAzICstCj4gICBkcml2
ZXJzL3JlbW90ZXByb2Mvc3RtMzJfY29wcm8uYyAgICAgIHwgICAzICstCj4gICBkcml2ZXJzL3Jl
bW90ZXByb2MvdGlfazNfZHNwX3Jwcm9jLmMgIHwgICAyICstCj4gICBkcml2ZXJzL3JlbW90ZXBy
b2MvdGlfazNfcjVmX3Jwcm9jLmMgIHwgICAyICstCj4gICBpbmNsdWRlL2FzbS1nZW5lcmljL2lv
LmggICAgICAgICAgICAgIHwgIDM3ICsrKysKPiAgIGluY2x1ZGUvcmVtb3RlcHJvYy5oICAgICAg
ICAgICAgICAgICAgfCAgIDMgKy0KPiAgIGxpYi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKwo+ICAgbGliL2lvbWVtX2NvcHkuYyAgICAgICAgICAgICAgICAgICAgICB8
IDEzNiArKysrKysrKysrKysrCj4gICAyMSBmaWxlcyBjaGFuZ2VkLCA3MzEgaW5zZXJ0aW9ucygr
KSwgMzUgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IDQ4ZjIxZTY2ZTM2MDU1MmM3
NWQ3MGE1MDQyMWQwZTBlZDFmNTllOTAKPiBjaGFuZ2UtaWQ6IDIwMjUxMDEyLWlteC1ycHJvYy0z
ODNkYjc1MmMzZjcKPgo+IEJlc3QgcmVnYXJkcywKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
