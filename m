Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69462BD89DD
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 12:00:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9B08C3FACE;
	Tue, 14 Oct 2025 10:00:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1017C3FACB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 10:00:03 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59E9xgK51041174;
 Tue, 14 Oct 2025 04:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760435982;
 bh=KBwvFWJx3s8V7Siqs+VGOJoIlO3RKW6ee2VF5g29rXk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=sSsB4ZoD6jyDnPpzAVVGKBon6QHQ1bVTK2FsfMOOwuwzLTPaNM7+VEVcZl8ZNy5JU
 lGihFNYDG2VUM2hHS/wTD3DMtmzbctp8WRjANchkGI8sx9JympiN6/Yj/HcwqrK/T1
 Pu+on7i2A63Ku8g2H+JR9zaBFrV8HDyAysHdwe7M=
Received: from DLEE203.ent.ti.com (dlee203.ent.ti.com [157.170.170.78])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59E9xgpn356800
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Oct 2025 04:59:42 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 04:59:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 04:59:41 -0500
Received: from [172.24.26.46] (lt5cd2489kgj.dhcp.ti.com [172.24.26.46])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59E9xZYk3607441;
 Tue, 14 Oct 2025 04:59:36 -0500
Message-ID: <d548843d-9342-43fa-8d18-f44105feff20@ti.com>
Date: Tue, 14 Oct 2025 15:29:35 +0530
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
 Ye Li <ye.li@nxp.com>, u-kumar1@ti.com,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
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

SGkgUGVuZwoKT24gMTAvMTMvMjAyNSA4OjE5IEFNLCBQZW5nIEZhbiAoT1NTKSB3cm90ZToKPiBU
aGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHJlbW90ZXByb2Mgc3VwcG9ydCBmb3IgTlhQIGku
TVg4TSBhbmQgaS5NWDkzCj4gcGxhdGZvcm1zLiBNb3N0IG9mIHRoZSBpLk1YLXNwZWNpZmljIGxv
Z2ljIGlzIHBvcnRlZCBmcm9tIHRoZSBMaW51eCBrZXJuZWwgdG8KPiBlbnN1cmUgY29tcGF0aWJp
bGl0eSBhbmQgbWFpbnRhaW5hYmlsaXR5Lgo+Cj4gVGhlIGV4aXN0aW5nIGJvb3RhdXggY29tbWFu
ZCBpbiBVLUJvb3Qgb25seSBzdXBwb3J0cyBsb2FkaW5nIHJhdyBiaW5hcnkgaW1hZ2VzLgo+IEhv
d2V2ZXIsIHRoaXMgYXBwcm9hY2ggZmFpbHMgd2hlbiB0aGUgcmVtb3RlIHByb2Nlc3NvciBmaXJt
d2FyZSBjb250YWlucwo+IHNlY3Rpb25zIHRoYXQgbXVzdCBiZSBsb2FkZWQgaW50byBib3RoIFRD
TSBhbmQgRERSLiBUbyBhZGRyZXNzIHRoaXMgbGltaXRhdGlvbiwKPiBuZWVkIHRvIHVzZSByZW1v
dGVwcm9jIGZyYW1ld29yayBFTEYgbG9hZGVyLCBlbmFibGluZyBwcm9wZXIgbG9hZGluZyBvZgo+
IHNlZ21lbnRlZCBmaXJtd2FyZSBpbWFnZXMuCgoKSSBhbSBub3Qgc3VyZSwgd2hhdCBwcm9ibGVt
IHlvdSBhcmUgZmFjaW5nIHRvIGxvYWQgZncgaGF2aW5nIHNlY3Rpb24gaW4gClRDTSBhbmQgRERS
IGJvdGgswqAgd2l0aCBjdXJyZW50IGZyYW1lLXdvcmsuCgpUaGVyZSBhcmUgZmV3IGRyaXZlcnMs
IHVzaW5nIGJvdGggVENNIGFuZCBERFIgYW5kIHdvcmtpbmcgb2sgcmVmWzBdCgpbMF0gCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL3UtYm9vdC92MjAyNS4xMC9zb3VyY2UvZHJpdmVycy9yZW1v
dGVwcm9jL3RpX2szX3I1Zl9ycHJvYy5jI0wxMTAgCgoKCgoKPgo+IFBhdGNoIFN1bW1hcnk6Cj4K
PiBQYXRjaGVzIDHigJMyOiBJbXBvcnQgbWVtY3B5X2lvIGFuZCBtZW1zZXRfaW8gZnJvbSB0aGUg
TGludXgga2VybmVsIGFuZCBlbmFibGUKPiAgICAgICAgICAgICAgIHRoZW0gaW4gdGhlIHJlbW90
ZXByb2Mgc3Vic3lzdGVtLgo+IFBhdGNoZXMgM+KAkzExOiBBZGQgcGxhdGZvcm0tc3BlY2lmaWMg
cmVtb3RlcHJvYyBzdXBwb3J0IGZvciBpLk1YOE0gYW5kIGkuTVg5My4KPiBQYXRjaCA2OiBUZW1w
b3JhcmlseSBhZGRzIENvcnRleC1NIG5vZGVzIHRvIHgtdS1ib290LmR0c2kgc2luY2UgdGhleSBh
cmUgbm90Cj4gICAgICAgICAgIHlldCBhdmFpbGFibGUgaW4gdGhlIHVwc3RyZWFtIExpbnV4IGRl
dmljZSB0cmVlLiBUaGVzZSBub2RlcyBjYW4gYmUKPiAJIHJlbW92ZWQgb25jZSB0aGV5IGFyZSBt
ZXJnZWQgdXBzdHJlYW0uCj4KPiBOWFAgaW50ZXJuYWwgUi1iIHRhZ3MgYXJlIGtlcHQsIGJlY2F1
c2UgdGhlIHBhdGNoZXMgYXJlIGRpcmVjdGx5Cj4gY2hlcnJ5LXBpY2tlZCBmcm9tIE5YUCBMVFMg
dHJlZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+IC0t
LQo+IFBlbmcgRmFuICgxMSk6Cj4gICAgICAgIGxpYjogSW1wb3J0IGlvbWVtX2NvcHkgZnJvbSBM
aW51eCBLZXJuZWwKPiAgICAgICAgcmVtb3RlcHJvYzogRXh0ZW5kIGRldmljZV90b192aXJ0IHdp
dGggYSBpc19pb21lbSBwYXJhbWV0ZXIKPiAgICAgICAgcmVtb3RlcHJvYzogQWRkIGlteF9ycHJv
YyBkcml2ZXIgdG8gc3VwcG9ydCBOWFAgaS5NWDhNUC9OCj4gICAgICAgIHJlbW90ZXByb2M6IGlt
eF9ycHJvYzogU3VwcG9ydCBpLk1YOE1RL00KPiAgICAgICAgcmVtb3RlcHJvYzogaW14X3Jwcm9j
OiBBZGQgc3VwcG9ydCBmb3IgaS5NWDkzIENNMzMKPiAgICAgICAgYXJtOiBkdHM6IGlteDhtOiBB
ZGQgcmVtb3RlcHJvYyBub2RlCj4gICAgICAgIGlteDhtcDogRW5hYmxlIHJlbW90ZXByb2MgZm9y
IGkuTVg4TVAgRVZLCj4gICAgICAgIGlteDhtbTogRW5hYmxlIHJlbW90ZXByb2MgZm9yIGkuTVg4
TU0gRVZLCj4gICAgICAgIGlteDhtbjogRW5hYmxlIHJlbW90ZXByb2MgZm9yIGkuTVg4TU4gRVZL
Cj4gICAgICAgIGlteDhtcTogRW5hYmxlIHJlbW90ZXByb2MgZm9yIGkuTVg4TVEgRVZLCj4gICAg
ICAgIGlteDkzOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDkzLUVWSy9RU0IvRlJETQo+Cj4g
ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIGFyY2gv
YXJtL2R0cy9pbXg4bW0tdS1ib290LmR0c2kgICAgICAgfCAgIDQgKwo+ICAgYXJjaC9hcm0vZHRz
L2lteDhtbi11LWJvb3QuZHRzaSAgICAgICB8ICAgNCArCj4gICBhcmNoL2FybS9kdHMvaW14OG1w
LXUtYm9vdC5kdHNpICAgICAgIHwgICA0ICsKPiAgIGFyY2gvYXJtL2R0cy9pbXg4bXEtdS1ib290
LmR0c2kgICAgICAgfCAgIDQgKwo+ICAgYXJjaC9hcm0vbWFjaC1pbXgvaW14OG0vS2NvbmZpZyAg
ICAgICB8ICAyMCArKwo+ICAgYXJjaC9hcm0vbWFjaC1pbXgvaW14OS9LY29uZmlnICAgICAgICB8
ICAxMiArKwo+ICAgZHJpdmVycy9yZW1vdGVwcm9jL0tjb25maWcgICAgICAgICAgICB8ICAgNyAr
Cj4gICBkcml2ZXJzL3JlbW90ZXByb2MvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAgIGRy
aXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyAgICAgICAgfCAzNzAgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAgZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5oICAg
ICAgICB8ICA1NiArKysrKwo+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3JlbmVzYXNfYXBtdS5jICAg
ICB8ICAgMyArLQo+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3Jwcm9jLWVsZi1sb2FkZXIuYyB8ICA5
MyArKysrKystLS0KPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9zYW5kYm94X3Rlc3Rwcm9jLmMgfCAg
IDMgKy0KPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9jb3Byby5jICAgICAgfCAgIDMgKy0K
PiAgIGRyaXZlcnMvcmVtb3RlcHJvYy90aV9rM19kc3BfcnByb2MuYyAgfCAgIDIgKy0KPiAgIGRy
aXZlcnMvcmVtb3RlcHJvYy90aV9rM19yNWZfcnByb2MuYyAgfCAgIDIgKy0KPiAgIGluY2x1ZGUv
YXNtLWdlbmVyaWMvaW8uaCAgICAgICAgICAgICAgfCAgMzcgKysrKwo+ICAgaW5jbHVkZS9yZW1v
dGVwcm9jLmggICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICAgbGliL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICBsaWIvaW9tZW1fY29weS5jICAgICAgICAg
ICAgICAgICAgICAgIHwgMTM2ICsrKysrKysrKysrKysKPiAgIDIxIGZpbGVzIGNoYW5nZWQsIDcz
MSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogNDhm
MjFlNjZlMzYwNTUyYzc1ZDcwYTUwNDIxZDBlMGVkMWY1OWU5MAo+IGNoYW5nZS1pZDogMjAyNTEw
MTItaW14LXJwcm9jLTM4M2RiNzUyYzNmNwo+Cj4gQmVzdCByZWdhcmRzLApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
