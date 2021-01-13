Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7072F4A39
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 12:36:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 101B1C424BE;
	Wed, 13 Jan 2021 11:36:26 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEE35C32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 11:36:22 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DG54P5bXSz1qvqx;
 Wed, 13 Jan 2021 12:36:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DG54P3D3Vz1tSQB;
 Wed, 13 Jan 2021 12:36:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id iL5RHzHxDM8q; Wed, 13 Jan 2021 12:36:19 +0100 (CET)
X-Auth-Info: 3B5qwbOnyrdM88o9i35+Rm6Esb3WvK8nQlso207MuTs=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 13 Jan 2021 12:36:19 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210111123329.1.I62e8df98aef0f695209fcc494c90777fb5beccb4@changeid>
 <f8971553-1707-481d-b9a7-87acff670dc8@denx.de>
 <7274fcd6-228f-80f8-b24b-b21390585514@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <312def98-eb67-c31f-5b70-c773ad3bad62@denx.de>
Date: Wed, 13 Jan 2021 12:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7274fcd6-228f-80f8-b24b-b21390585514@foss.st.com>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 alexandre.torgue@foss.st.com
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with
	v5.11-rc2
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

T24gMS8xMy8yMSAxMDo0OCBBTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSBNYXJlaywK
CkhpLAoKPiBPbiAxLzExLzIxIDE6MTUgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAxLzEx
LzIxIDEyOjMzIFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4gRGV2aWNlIHRyZWUgYWxp
Z25tZW50IHdpdGggTGludXgga2VybmVsIHY1LjExLXJjMgo+Pj4gLSBmaXggRENNSSBETUEgZmVh
dHVyZXMgb24gc3RtMzJtcDE1IGZhbWlseQo+Pj4gLSBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3Ig
Rk1DIEVCSSBidXMKPj4+IC0gSGFybW9uaXplIEVIQ0kvT0hDSSBEVCBub2RlcyBuYW1lIG9uIHN0
bTMybXAxNQo+Pj4gLSB1cGRhdGUgc2RtbWMgSVAgdmVyc2lvbiBmb3IgU1RNMzJNUDE1Cj4+PiAt
IEFkZCBMUCB0aW1lciBpcnFzIG9uIHN0bTMybXAxNTEKPj4+IC0gQWRkIExQIHRpbWVyIHdha2V1
cC1zb3VyY2Ugb24gc3RtMzJtcDE1MQo+Pj4gLSBlbmFibGUgSEFTSCBieSBkZWZhdWx0IG9uIHN0
bTMybXAxNQo+Pj4gLSBlbmFibGUgQ1JDMSBieSBkZWZhdWx0IG9uIHN0bTMybXAxNQo+Pj4gLSBl
bmFibGUgQ1JZUCBieSBkZWZhdWx0IG9uIHN0bTMybXAxNQo+Pj4gLSBzZXQgYnVzLXR5cGUgaW4g
RENNSSBlbmRwb2ludCBmb3Igc3RtMzJtcDE1N2MtZXYxIGJvYXJkCj4+PiAtIHJlb3JkZXIgc3Bp
NCB3aXRoaW4gc3RtMzJtcDE1LXBpbmN0cmwKPj4+IC0gYWRkIFNUVVNCMTYwMCBUeXBlLUMgdXNp
bmcgSTJDNCBvbiBzdG0zMm1wMTV4eC1ka3gKPj4+IC0gZml4IG1kbWExIGNsaWVudHMgY2hhbm5l
bCBwcmlvcml0eSBsZXZlbCBvbiBzdG0zMm1wMTUxCj4+PiAtIGZpeCBkbWFtdXggcmVnIHByb3Bl
cnR5IG9uIHN0bTMybXAxNTEKPj4+IC0gYWRqdXN0IFVTQiBPVEcgZ2FkZ2V0IGZpZm8gc2l6ZXMg
aW4gc3RtMzJtcDE1MQo+Pj4gLSB1cGRhdGUgc3RtMzJtcDE1MSBmb3IgcmVtb3RlIHByb2Mgc3lu
Y2hyb25pemF0aW9uIHN1cHBvcnQKPj4+IC0gc3VwcG9ydCBjaGlsZCBtZmQgY2VsbHMgZm9yIHRo
ZSBzdG0zMm1wMSBUQU1QIHN5c2Nvbgo+Pgo+PiBBcmUgeW91IGNvbXBsZXRlbHkgc3VyZSB0aGUg
ZGhjb20gYmFzZWQgYm9hcmRzIGdlbmVyYXRlIHRoZSBzYW1lIERUIAo+PiBhZnRlciB0aGUgc3lu
YyA/Cj4+Cj4+IEkgd291bGQgcmF0aGVyIHByZWZlciBzeW5jIHdpdGggTGludXggNS4xMCAoTFRT
KSwgb3IgaXMgdGhhdCBub3QgYW4gCj4+IG9wdGlvbiBkdWUgdG8gc29tZSBleHRyYSBEVCBwYXRj
aGVzID8KPj4KPj4gRWl0aGVyIHdheSwgaWYgeW91IGhhdmUgYW4gdXBzdHJlYW0gcXVldWUgZm9y
IHRoaXMgRFQgc3luYyBzb21ld2hlcmUsIAo+PiBwbGVhc2UgZ2l2ZSBtZSBhIGxpbmssIEkgcGxh
biB0byBzeW5jIHRoZSBkaGNvbSBib2FyZHMgYWZ0ZXIgMjAyMS4wMSAKPj4gaXMgb3V0LCBzbyBJ
IHdvdWxkIGJ1aWxkIG9uIHRvcCBvZiB0aGF0Lgo+IAo+IEkgYW0gc3VyZSB0aGUgRFQgaXMgbm90
IHRoZSBzYW1lLCBzb3JyeS4KPiAKPiBBdCBsZWFzdCBmb3IgdGhlIFNPQyBwYXJ0IChuZXcgbm9k
ZXMsIHVwZGF0ZXMgdmFsdWUpLgo+IAo+IEkgY29tcGFyZSB0aGUgZGhjb20gZGV2aWNlIHRyZWUg
KGR0cyBmaWxlIGZvcm0gZHRiKSBhbmQgSSBkb24ndCBmb3VuZCAKPiBtb2RpZmljYXRpb25zIGV4
Y2VwdCB0aGUgcGhhbmRsZSBjaGFuZ2VzIGFuZCB0aGUgZXhwZWN0ZWQgbW9kaWZpY2F0aW9ucy4K
PiAKPiBCdXQgaXQgaXMgbm90IGEgZXhoYXVzdGl2ZSBjaGVjay4KClRoZXJlIGlzIGR0ZGlmZiwg
eW91IGNhbiBydW4gaXQgb24gdGhlIGdlbmVyYXRlZCBTUEwgYW5kIFUtQm9vdCBEVEJzIApiZWZv
cmUgYW5kIGFmdGVyIHlvdXIgY2hhbmdlcy4gVGhhdCBzaG91bGQgYmUgYSB0aG9yb3VnaCBjaGVj
ay4KCj4gRm9yIFNUIGJvYXJkcywgdGhlIFUtQm9vdCBkZXZpY2UgdHJlZXMgYXJlIGFsaWduZWQg
d2l0aMKgIExpbnV4IDUuOSBzaW5jZSAKPiB0aGUgY29tbWl0IDYyZjk1YWY5MmEzZmMyMWE3MmY1
ZjMxOThmMGQwNjVjYmQ3NzNmMDMgKCJBUk06IGR0czogCj4gc3RtMzJtcDE6IERUIGFsaWdubWVu
dCB3aXRoIExpbnV4IGtlcm5lbCB2NS45LXJjNCIpCj4gCj4gSSBza2lwIHRoZSBMaW51eCA1LjEw
IChMVFMpIGFzIGl0IGNvbWVzIGFmdGVyIHYyMDIwLjEwIG1lcmdlIHdpbmRvd3MgYW5kIAo+IHRo
ZSA1LjExIGRldmljZSB0cmVlIGFyZSBhbHJlYWR5IHVwZGF0ZWQgKHB1bGwgcmVxdWVzdCBmcm9t
IEFsZXhhbmRyZSAKPiBUb3JndWUgPSAKPiBodHRwczovL2tlcm5lbC5nb29nbGVzb3VyY2UuY29t
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hdG9yZ3VlL3N0bTMyKQo+IAo+IEJ1dCBpZiB5b3Ug
cHJlZmVyIEkgY2FuIHNwbGl0IGl0IGluIDIgc3RlcHMKPiAKPiAxLyBEZXZpY2UgdHJlZSBhbGln
bm1lbnQgd2l0aCBMaW51eCBrZXJuZWwgdjUuMTAgKExUUykKPiAKPiAyLyBEZXZpY2UgdHJlZSBh
bGlnbm1lbnQgd2l0aCBMaW51eCBrZXJuZWwgdjUuMTEtcmMyCj4gCj4gVG9kYXkgdGhlIHBhdGNo
IGlzIHByZXNlbnQgaW4gbmV4dCBicmFuY2ggb2Ygc3RtIGN1c3RvZGlhbnMgCj4gKGh0dHBzOi8v
Z2l0bGFiLmRlbnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS8tL3RyZWUvbmV4dCkK
PiAKPiBBbmQgSSBhbSBwcmVwYXJpbmcgYSBwdWxsIHJlcXVlc3QgZm9yIHRoZSBtYXN0ZXIgYnJh
bmNoLgoKS2VlcCBpdCBhcy1pcywgSSBqdXN0IHdhbnRlZCB0byBrbm93IHdoeSB5b3UgZGlkbid0
IHBpY2sgdGhlIExUUyBvcHRpb24sIApub3cgaXQncyBjbGVhciwgdGhhbmtzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
