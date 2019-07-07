Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F9668398
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jul 2019 08:37:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41BE0C5BAE2
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jul 2019 06:37:20 +0000 (UTC)
Received: from koncepto.io (koncepto.io [195.154.119.111])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D17BC7B4DD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jul 2019 18:19:01 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-1-8923-205.w193-250.abo.wanadoo.fr
 [193.250.65.205])
 by koncepto.io (Postfix) with ESMTPSA id B600960046;
 Sun,  7 Jul 2019 20:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
 s=default; t=1562523540;
 bh=2YXYXZ1dtZ0rcOb00toX/vyp9T6EIcltviUPVbLm9bc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vk9AMugDVycp4lK40wHDKUkskWb43MGC/MEjeOKFLitfdamUDIYn+n0d22GzmpGAq
 AlcGxUTFEibAims4DdYmlUtgrfQ2VT1T6p7Xyu0u5dOsJzC20EWK7ZWEoL+IpGHuBb
 n472kxeUxzXNDaVtmF/C4rNplzZ9bo1eXvPV8RjVDrPRcfeha15Vod1s/BSgCZKlAp
 saBQ83iVeTY+zMzmOlSuTk5QrXbBvU/mS7cRN1RTBp2w9oUbbyGh0RdKhkd7GfOKrZ
 hrZEzdL6wXbJB2jYHWhPk+fMwMNiKqrN6cG2od8mJiEouyMfaBm9Wspo9QX2HyKQZe
 2Qiilcm3GQ3IA==
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-2-git-send-email-patrick.delaunay@st.com>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <69769fb6-bfdc-ebf8-790e-c90abe7e580e@koncepto.io>
Date: Sun, 7 Jul 2019 20:19:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562340023-8516-2-git-send-email-patrick.delaunay@st.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 15 Jul 2019 06:37:19 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 01/16] stm32mp1: deactivate
 WATCHDOG in defconfig
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

CkxlIDA1LzA3LzIwMTkgw6AgMTc6MjAsIFBhdHJpY2sgRGVsYXVuYXkgYSDDqWNyaXTCoDoKPiBE
ZWFjdGl2YXRlIFdBVENIRE9HIGJ5IGRlZmF1bHQgaW4gdS1ib290IHRvIGF2b2lkIGlzc3VlIHRv
IGJvb3Qga2VybmVsCj4gYW5kIHJvb3RmcyB3aXRob3V0IHRoZSBuZWVkZWQgZGFlbW9uIHRvIHJl
bG9hZCBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QHN0LmNvbT4KPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4gCj4gICBjb25m
aWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcgICB8IDIgLS0KPiAgIGNvbmZpZ3Mvc3RtMzJt
cDE1X3RydXN0ZWRfZGVmY29uZmlnIHwgMiAtLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25m
aWcgYi9jb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcKPiBpbmRleCA0YWExODRmLi5i
MWZjM2EyIDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZwo+
ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZwo+IEBAIC0xMTAsNSArMTEw
LDMgQEAgQ09ORklHX1VTQl9HQURHRVRfTUFOVUZBQ1RVUkVSPSJTVE1pY3JvZWxlY3Ryb25pY3Mi
Cj4gICBDT05GSUdfVVNCX0dBREdFVF9WRU5ET1JfTlVNPTB4MDQ4Mwo+ICAgQ09ORklHX1VTQl9H
QURHRVRfUFJPRFVDVF9OVU09MHg1NzIwCj4gICBDT05GSUdfVVNCX0dBREdFVF9EV0MyX09URz15
Cj4gLUNPTkZJR19XRFQ9eQo+IC1DT05GSUdfV0RUX1NUTTMyTVA9eQo+IGRpZmYgLS1naXQgYS9j
b25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X3Ry
dXN0ZWRfZGVmY29uZmlnCj4gaW5kZXggNWZlOTQ3Ny4uYWU5YmM3NiAxMDA2NDQKPiAtLS0gYS9j
b25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJt
cDE1X3RydXN0ZWRfZGVmY29uZmlnCj4gQEAgLTEwMCw1ICsxMDAsMyBAQCBDT05GSUdfVVNCX0dB
REdFVF9NQU5VRkFDVFVSRVI9IlNUTWljcm9lbGVjdHJvbmljcyIKPiAgIENPTkZJR19VU0JfR0FE
R0VUX1ZFTkRPUl9OVU09MHgwNDgzCj4gICBDT05GSUdfVVNCX0dBREdFVF9QUk9EVUNUX05VTT0w
eDU3MjAKPiAgIENPTkZJR19VU0JfR0FER0VUX0RXQzJfT1RHPXkKPiAtQ09ORklHX1dEVD15Cj4g
LUNPTkZJR19XRFRfU1RNMzJNUD15Cj4gCgpUZXN0ZWQtYnk6IFBpZXJyZS1KZWFuIFRleGllciA8
cGp0ZXhpZXJAa29uY2VwdG8uaW8+CgpSZWdhcmRzLAotLSAKUGllcnJlLUplYW4gVGV4aWVyCkVt
YmVkZGVkIExpbnV4IEVuZ2luZWVyCmh0dHBzOi8va29uY2VwdG8uaW8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
