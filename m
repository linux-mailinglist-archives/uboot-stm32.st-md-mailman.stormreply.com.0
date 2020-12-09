Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 233BD2D47C2
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Dec 2020 18:22:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8494C3FADA;
	Wed,  9 Dec 2020 17:22:57 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05E2CC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 17:22:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CrkQQ6fdyz1rync;
 Wed,  9 Dec 2020 18:22:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CrkQQ5z9Hz1qwlN;
 Wed,  9 Dec 2020 18:22:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3IiOf40vTn76; Wed,  9 Dec 2020 18:22:52 +0100 (CET)
X-Auth-Info: t3ak9CC7Ol9pRnQZtlmU2gM8QWX74eyRMtQRLJAW31Q=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  9 Dec 2020 18:22:52 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Amelie DELAUNAY <amelie.delaunay@foss.st.com>
References: <20201015144856.1.I77269d852e0f410c31f9d1f869815c4328510c12@changeid>
 <9ea18aa8-2c87-85cf-fba3-d753382f32e7@denx.de>
 <7fd5050f277643a78bb185b4c272b6c4@SFHDAG2NODE3.st.com>
 <eeaec9e8-764f-8869-33c3-0b3d4d74348e@denx.de>
 <b4e675d5caff47d1b207b67e6ca03e1f@SFHDAG2NODE3.st.com>
 <a86babf0-e628-1f10-848e-5fbdf9dd698a@denx.de>
 <6b18d5817aa84b92852d70132c0b7b8c@SFHDAG2NODE3.st.com>
 <6d85c0c5-3922-6c3a-15a5-eefb33d50d50@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f3c410cf-d770-1592-d4c1-1b19116ad844@denx.de>
Date: Wed, 9 Dec 2020 18:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6d85c0c5-3922-6c3a-15a5-eefb33d50d50@foss.st.com>
Content-Language: en-US
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: add "u-boot,
	force-vbus-detection" for stm32
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

T24gMTIvOS8yMCA2OjA0IFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgoKSGksCgpbLi4uXQoK
Pj4+Pj4gSSBhZGQgYSBuZXcgcHJvcGVydHkgdG8gYmUgYmFja3dhcmQgY29tcGF0aWJsZSAoZXZl
biBpdCB0aGUKPj4+Pj4gY29tYmluYWlzb24gaXMgbGVzcyBjbGVhcikgSSBwcm90ZWN0IHJlZ3Vs
YXRvciBmdW5jdGlvbiBjYWxsIHRvCj4+Pj4+IGF2b2lkIGNvbXBpbGF0aW9uCj4+Pj4gaXNzdWUg
Zm9yIG90aGVyIHBsYXRmb3JtLgo+Pj4+PiBQUzogYWZ0ZXIgcmVhZGluZyB0aGUgcmVmbWFudWFs
LCBJIGFsc28gc3BsaXQgVkFMT0VOIGFuZCBWQUxPVkFMIGJpdAo+Pj4+PiB1cGRhdGUKPj4+PiBh
cyBpdCBpcyByZXF1aXJlZC4KPj4+Pj4gU28geWVzIEkgdGhpbmsgaXQgaXMgbmVlZGVkIGJ1dCBJ
IGNhbiBzcGxpdCB0aGUgcGF0Y2ggdG8gc2ltcGxpZnkgCj4+Pj4+IHRoZSByZXZpZXcuCj4+Pj4g
SSBwcmVzdW1lIHlvdSBkb24ndCBmZWVsIGxpa2UgaW1wbGVtZW50aW5nIHByb3BlciBPVEcgc3Vw
cG9ydCwgcmlnaHQgPwo+Pj4gWWVzLCBJIGFtIGFmcmFpZCBvZiB0aGlzIHRhc2suCj4+IENhbiB5
b3UgdGFrZSBhIGxvb2sgPwo+Pgo+PiBJIHdpbGwgcGljayB0aGlzIHBhdGNoIGludG8gbmV4dCBm
b3Igbm93Lgo+IAo+IEkgY2hlY2sgdGhpcyB0b3BpYywgSSB0aGluayBJIGRvbid0IG5lZWQgdG8g
c3VwcG9ydCBPVEcgaW4gZHdjMgo+IAo+IGJ1dCBJIG5lZWQgdG8gc3VwcG9ydCBVU0IgcG9ydCBh
bmQgY29ubmVjdG9yIGFzIGl0IGlzIGRvbmUgaW4gbGludXgga2VybmVsLgo+IAo+IGFuZCBJIHRo
aW5rIHRoYXQgSSBjYW4gcHJvcG9zZSBhIHBsYW4gKDYgbW9udGgtMSB5ZWFyKQo+IAo+IC0gQWRk
IGEgbmV3IHUtY2xhc3MgZm9yIFVTQiBjb25uZWN0b3IgYmFzZWQgb24gCj4gbGludXgvZHJpdmVy
cy91c2IvdHlwZWMvY2xhc3MuYwo+IAo+ICDCoMKgwqAgPT4gQWxsb3cgdG8gZGV0ZWN0IGNhYmxl
IGNvbm5lY3Rpb24gYW5kIFVTQiBtb2RlIChkZXZpY2UgLyBob3N0KQo+IAo+IC0gQWRkIGEgbmV3
IGRyaXZlciBmb3IgVVNCIHR5cGUgQyBjb25uZWN0b3IgKGNvbXBhdGlibGUgInVzYi1jLWNvbm5l
Y3RvciIpCj4gCj4gLSBNaWdyYXRlIHN0dXNiMTYwMCBkcml2ZXIgdG8gdXNlIHRoaXMgbmV3IGRy
aXZlcgo+IAo+IC0gVXBkYXRlIGRyaXZlciAoZHdjMiBvciB1c2JwaHljIG9yIGRpcmVjdGx5IGlu
IHVjbGFzcyA/KSB0byB1c2UgCj4gY29ubmVjdG9yIHdoZW4gcHJlc2VudCBpbiBkZXZpY2UgdHJl
ZSAKPiAoZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sKQo+
IAo+IFdpdGggdGhlc2UgbW9kaWZjYXRpb25zLCBJIGhvcGUgdG8gaGF2ZSB0aGUgc2FtZSBob29r
cyB0aGFuIExpbnV4Lgo+IAo+IAo+IEFuZCBmb3IgZnV0dXJlCj4gCj4gLSBBZGQgYSBVU0IgdHlw
ZUMgY29ubmVjdG9yIGRyaXZlciBiYXNlZCBvbiBVQ1NJIAo+IChsaW51eC9kcml2ZXJzL3VzYi90
eXBlYy91Y3NpKQo+IAo+IGh0dHBzOi8vd3d3LmludGVsLmNvbS9jb250ZW50L2RhbS93d3cvcHVi
bGljL3VzL2VuL2RvY3VtZW50cy90ZWNobmljYWwtc3BlY2lmaWNhdGlvbnMvdXNiLXR5cGUtYy11
Y3NpLXNwZWMucGRmIAo+IAo+IAo+IC0gQWRhcHQgb3RoZXIgZHJpdmVyIHRvIHVzZSBVU0IgY29u
bmVjdG9yLi4uLi4gKGFzIERXQzMgZm9yIGV4YW1wbGUgdG8gCj4gbWFuYWdlIGR1YWwgcm9sZSB3
aXRoIHR5cGUtYykKClNvdW5kcyBnb29kLCB0aGFua3MgOikKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
