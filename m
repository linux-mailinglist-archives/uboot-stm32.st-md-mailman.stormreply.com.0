Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9463246C
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Nov 2022 14:56:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7C5DC6507D;
	Mon, 21 Nov 2022 13:56:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06300C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 13:56:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ALCkK6Q017593; Mon, 21 Nov 2022 14:56:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HKssBtitcHN5NIfK2arRSPNkLGqXj8CsDS7R62zZdjo=;
 b=JtW+KkH9NW8XNQtcvyBlUYWCdE5ohAwDKnarVP6HompH59A4HoI3D8RCCxOUSH+Fpql5
 vV922pW+phlj8T1Aj7AmEmVRlWManTkrbbMRC8CbiER8pA1yuJNbgUZSn9hly7OxkAOB
 VHcefFzs7tKXqcjymI4k+hcRCniu5Nq9dH3EEKCXlvJsqolDo5dPJBOKMGD87F+gCeAf
 QsG7SA015Z4RjXXhoAHbUKFHVKjBSYPc4CqhE7p8U1jotwbSXVdtdp201m5Myj+CDmpS
 TnOouWZmkdg/kPGzrZDEfejBIZX7PvSDjG30jXBzjm5kWSR8C561g5Si5IBggpMYhVvt TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxrabasyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 14:56:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E67510002A;
 Mon, 21 Nov 2022 14:56:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8D5F228A32;
 Mon, 21 Nov 2022 14:56:19 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 21 Nov
 2022 14:56:19 +0100
Message-ID: <0190a5e0-0ead-97c7-e183-ee931df4f634@foss.st.com>
Date: Mon, 21 Nov 2022 14:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
 <49a948fd-a392-6f30-f110-747ad3f3173b@denx.de>
 <29cf32ad-9e0c-c11b-abf5-e0d7f26126a6@foss.st.com>
 <23426234-56e0-f5d7-c09c-f2ffa63258bd@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <23426234-56e0-f5d7-c09c-f2ffa63258bd@denx.de>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] usb: hub: allow to increase
 HUB_DEBOUNCE_TIMEOUT
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

SGksCgpPbiA5LzI0LzIyIDE5OjA0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA5LzEyLzIyIDE1
OjM3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+PiBIaSwKPgo+IEhpLAo+Cj4+IE9uIDkvOS8y
MiAxNDoyNCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA5LzkvMjIgMTE6NDUsIFBhdHJpY2sg
RGVsYXVuYXkgd3JvdGU6Cj4+Pj4gQWRkIGEgbmV3IENPTkZJR19VU0JfSFVCX0RFQk9VTkNFX1RJ
TUVPVVQgdG8gaW5jcmVhc2UgdGhlCj4+Pj4gSFVCX0RFQk9VTkNFX1RJTUVPVVQgdmFsdWUsIGZv
ciBleGFtcGxlIHRvIDJzIGJlY2F1c2Ugc29tZSB1c2IgZGV2aWNlCj4+Pj4gbmVlZHMgYXJvdW5k
IDEuNXMgb3IgbW9yZSB0byBtYWtlIHRoZSBodWIgcG9ydCBzdGF0dXMgdG8gYmUKPj4+PiBjb25u
ZWN0ZWQgc3RlYWRpbHkgYWZ0ZXIgYmVpbmcgcG93ZXJlZCBvZmYgYW5kIHBvd2VyZWQgb24uCj4+
Pj4KPj4+PiBUaGlzIDJzIHZhbHVlIGlzIGFsaWduZWQgd2l0aCBMaW51eCBkcml2ZXIgYW5kIGF2
b2lkcyB0byBjb25maWd1cmUKPj4+PiAidXNiX3Bnb29kX2RlbGF5IiBhcyBhIHdvcmthcm91bmQg
Zm9yIGNvbm5lY3Rpb24gdGltZW91dCBvbgo+Pj4+IHNvbWUgVVNCIGRldmljZTsgbm9ybWFsbHkg
dGhlIGVudiB2YXJpYWJsZSAidXNiX3Bnb29kX2RlbGF5IiBpcyB1c2VkCj4+Pj4gdG8gZGVsYXkg
dGhlIGZpcnN0IHF1ZXJ5IGFmdGVyIHBvd2VyIE9OIGFuZCB0aHVzIHRoZSBkZXZpY2UgYW5zd2Vy
LAo+Pj4+IGJ1dCB0aGlzIHZhcmlhYmxlIG5vdCB1c2VkIHRvIGluY3JlYXNlIHRoZSBjb25uZWN0
aW9uIHRpbWVvdXQgZGVsYXkuCj4+Pgo+Pj4gSSByZWFsaXplZCB0aGlzIGhhcyBvbmUgcHJvYmxl
bSAtLSB3aGF0IGhhcHBlbnMgaWYgeW91IGhhdmUgbXVsdGlwbGUgCj4+PiBVU0IgY29udHJvbGxl
cnMgaW4geW91ciBzeXN0ZW0gPyBUaGUgYW5zd2VyIGlzLCBhbGwgb2YgdGhlbSBhcmUgCj4+PiBh
ZmZlY3RlZCBieSB0aGUgaW5jcmVhc2VkIGRlbGF5LCBwb3NzaWJseSBldmVuIHRob3NlIHdoaWNo
IGRvIG5vdCAKPj4+IHJlcXVpcmUgdGhlIGV4dHJhIGRlbGF5Lgo+Pj4KPj4+IFdvdWxkIGl0IGJl
IHBvc3NpYmxlIHRvIGNvbmZpZ3VyZSB0aGlzIHBlci1jb250cm9sbGVyIChvciBzaG91bGQgCj4+
PiB0aGlzIGV2ZW4gYmUgcGVyLWRldmljZT8pIGluIERUID8gSW4gZmFjdCwgSSB3b25kZXIgd2hl
dGhlciB0aGlzIGlzIAo+Pj4gbm90IGJlY29taW5nIGEgVmJ1cyByZWd1bGF0b3IgcmFtcC11cCB0
aW1lIGtpbmQgb2YgZGVsYXkgaGVyZSA/Cj4+Cj4+Cj4+IFllcywgYnV0IEkgZG9uJ3QgdGhpbmss
IGl0IGlzIGJsb2NraW5nLgo+Pgo+PiBUaGlzIHRpbWVvdXQgd2lsbCBiZSBjb21tb24gZm9yIGFs
bCB0aGUgVVNCIEhVQiBpbiB0aGUgc3lzdGVtLCBhcyBpdCAKPj4gaXMgZG9uZSBpbiBMaW51eCBr
ZXJuZWwuCj4KPiBJIGp1c3QgcmVhbGl6ZWQgdGhpcyBpcyBub3QgdGhlIHNhbWUgZGVsYXkgYXMg
dGhlIHVzYl9wZ29vZF9kZWxheSwgCj4gcmlnaHQgPwo+CgpZZXMgaXQgaXMgMiBkaWZmZXJlbnQg
dGltZW91dCBpbiBVU0Igc3RhY2ssIHVzYl9zY2FuX3BvcnQoKQoKMS8gcGdvb2RfZGVsYXkgdXNl
ZCBpbgoKIMKgwqDCoMKgIGh1Yi0+cXVlcnlfZGVsYXkgPSBnZXRfdGltZXIoMCkgKyBtYXgoMTAw
LCAoaW50KXBnb29kX2RlbGF5KTsKCiDCoMKgwqDCoCA9PiB0aW1lIGJlZm9yZSB0aGUgZGV2aWNl
cyBhcmUgcXVlcmllZAoKCiDCoMKgIMKgICogRG9uJ3QgdGFsayB0byB0aGUgZGV2aWNlIGJlZm9y
ZSB0aGUgcXVlcnkgZGVsYXkgaXMgZXhwaXJlZC4KIMKgwqAgwqAgKiBUaGlzIGlzIG5lZWRlZCBm
b3Igdm9sdGFnZXMgdG8gc3RhYmFsaXplLgoKMi8gSFVCX0RFQk9VTkNFX1RJTUVPVVQgdXNlZCBp
bgoKIMKgwqDCoCBodWItPmNvbm5lY3RfdGltZW91dCA9wqAgaHViLT5xdWVyeV9kZWxheSArIEhV
Ql9ERUJPVU5DRV9USU1FT1VUCgogwqDCoMKgID0+IHRpbWVvdXQgKG1heCnCoMKgIGZvciB1c2Jf
Z2V0X3BvcnRfc3RhdHVzKCkgYW5zd2VyIE9SIE5vIApjb25uZWN0aW9uIGNoYW5nZSBoYXBwZW5l
ZCAocG9ydGNoYW5nZS9wb3J0c3RhdHVzKQoKCgo+IFRoaXMgaXMgYWN0dWFsbHkgdGhlIG1heGlt
dW0gd2FpdCBmb3IgYSBkZXZpY2UgdG8gc3RhcnQgY29tbXVuaWNhdGluZywgCj4gaS5lLiBldmVu
IGlmIHRoaXMgdGltZW91dCBpcyBzZXQgdG8gYSB2ZXJ5IGhpZ2ggdmFsdWUsIG1vc3QgZGV2aWNl
cyAKPiB3aWxsIG5vdCB0YWtlIHRoYXQgbG9uZyBhbmQgd2lsbCBzdGFydCBjb21tdW5pY2F0aW5n
IGluIHNob3J0ZXIgdGltZSAKPiBhbnl3YXksIHNvIHRoZSB0aW1lIG9mIGNvbXBsZXRpb24gZm9y
IGUuZy4gJz0+IHVzYiByZXNldCcgaXMgbm90IAo+IGFmZmVjdGVkIGJ5IHRoaXMgY2hhbmdlIG9u
IHZlcnkgbXVjaCBhbGwgc3lzdGVtcywgY29ycmVjdCA/CgoKWWVzwqAgYXMgaXQgaXMgYSBtYXgg
dmFsdWUsIGl0IGlzIGEgcHJvdGVjdGlvbiB0aW1lb3V0IGZvciBwcm9ibGVtYXRpYyAKZGV2aWNl
cywKCml0IHNob3VsZCBub3Qgb2NjdXIgZm9yIG5vcm1hbCB1c2UgY2FzZSwgYnV0IG9ubHkgd2hl
biB0aGUgZGV2aWNlIGFyZSAKY29ycmVjdGx5IGRldGVjdGVkIG9uIHRoZSBIVUIgcG9ydC4uLgoK
CkkgdGhpbmsgdGhlIHRoZSAndXNiIHJlc2V0JyBzZXF1ZW5jZcKgIGlzIGltcGFjdGVkOgoKIMKg
dXNiX2luaXQgPT4gdXNiX25ld19kZXZpY2UgPT4gdXNiX2h1Yl9wcm9iZSA9PiB1c2JfaHViX2Nv
bmZpZ3VyZSA9CgogwqAgLSB1c2JfaHViX3Bvd2VyX29uKCkKCiDCoMKgIC11c2JfZGV2aWNlX2xp
c3Rfc2NhbigpCgoKQnV0IGFzIGl0IGlzIGEgQ09ORklHIGl0IGlzIGEgcGxhdGZvcm0gY2hvaWNl
LgoKClJlZ2FyZHMKCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0Cj4gVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQo+IGh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
