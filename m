Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0DAECFD1
	for <lists+uboot-stm32@lfdr.de>; Sun, 29 Jun 2025 21:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4341CC36B31;
	Sun, 29 Jun 2025 19:08:39 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F780C36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Jun 2025 19:08:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bVf2p3jwyz9ssr;
 Sun, 29 Jun 2025 21:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751224114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=komzSIjPPmepdIOb2HgE9LP+I6bWmyz+n7UbSNiMZdo=;
 b=Qn4+y9Zi7UiK6EffbD715cIq84/uzOPLO6AzkDYGjAly6n6F/MCh25wnzNgYZzsgFmVOVx
 G7txMBtPcSELGanPMfUqCCSRBHnj80xx2AdkaR4jxSef6EPziBltn7Fsi9ElX47ZpAnZrp
 6n0lJs9rhL77BgZss3W7jEKucdjvRY4yA1eEALHQMgynbAGrnfXJJ/WDI+xwe6CKaVeC4G
 j+r3CyyJf9NBFw2XlNoWiIZZA1vuCY9AMWsj3rpDAPGqLOxWfTQz5M+nsOaN00epT0I2vq
 Vq86443p4gPYOEKVPqIzLmP6Hd+5rMHpNQKW9Jh0klPGLWeo1ZrvSIov0ymw5w==
Message-ID: <43ba9ad2-e2df-44e3-9bc0-1b7e343ff1b3@mailbox.org>
Date: Sun, 29 Jun 2025 21:08:31 +0200
MIME-Version: 1.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-2-marek.vasut@mailbox.org>
 <ce033305-387b-4732-a711-5a4a9f4237e3@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ce033305-387b-4732-a711-5a4a9f4237e3@foss.st.com>
X-MBO-RS-ID: 46dd29496a6b17b4e35
X-MBO-RS-META: meq7oz4n5e5nee4dm8q561uw8dpe4r8w
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PATCH 01/10] ARM: stm32: Add STM32MP13xx SPL
	Kconfig options
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

T24gNi8zLzI1IDM6MjYgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6CgpIaSwKCj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZy4xM3ggYi9hcmNoL2FybS9tYWNo
LSAKPj4gc3RtMzJtcC9LY29uZmlnLjEzeAo+PiBpbmRleCBiYzhiM2Y4Y2Y3Ny4uY2VjZjllM2I4
YzcgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnLjEzeAo+PiAr
KysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZy4xM3gKPj4gQEAgLTIwLDcgKzIwLDgg
QEAgY29uZmlnIFRBUkdFVF9TVF9TVE0zMk1QMTNYCj4+IMKgIGVuZGNob2ljZQo+PiDCoCBjb25m
aWcgVEVYVF9CQVNFCj4+IC3CoMKgwqAgZGVmYXVsdCAweEMwMDAwMDAwCj4+ICvCoMKgwqAgZGVm
YXVsdCAweEMwMDAwMDAwIGlmIFRGQUJPT1QKPj4gK8KgwqDCoCBkZWZhdWx0IDB4QzAxMDAwMDAg
aWYgIVRGQUJPT1QKPj4gwqAgY29uZmlnIFBSRV9DT05fQlVGX0FERFIKPj4gwqDCoMKgwqDCoCBk
ZWZhdWx0IDB4QzA4MDAwMDAKPiAKPiAKPiBJIGRvbid0IHVuZGVyc3Rvb2TCoCB3aHkgeW91IG1v
ZGlmeSBURVhUX0JBU0UgaGVyZS4KTG9hZGluZyBvZiBkYXRhIHRvIHRoZSB2ZXJ5IGJlZ2lubmlu
ZyBvZiBEUkFNIG1heSBmYWlsIGluIGNhc2UgdGhlIGRhdGEgCmFyZSB3cmFwcGVkIGluIHZhcmlv
dXMgY29udGFpbmVyIGltYWdlIHR5cGVzLCBiZWNhdXNlIHRoZSBpbWFnZSBsb2FkZXIgCmluIFNQ
TCBtYXkgdXNlIHRoZSBhcmVhIGJlZm9yZSB0aGUgZGF0YSBsb2FkIGFkZHJlc3MgdG8gbG9hZCBm
b3IgZXhhbXBsZSAKaW1hZ2UgaGVhZGVyKHMpIGluIHRoZXJlLiBUaGlzIGlzIG9uZSBleGFtcGxl
IG9mIHN1Y2ggaGVhZGVyIGxvYWRpbmcsIAp3aGljaCBpcyB0cmlnZ2VyZWQgb24gU1RNMzJNUDEz
eHggaW4gU1BMOgoKaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi9t
YXN0ZXIvaW5jbHVkZS9zcGxfbG9hZC5oI0wxOAoKIgogIDE4ICAgICAgICAgc3RydWN0IGxlZ2Fj
eV9pbWdfaGRyICpoZWFkZXIgPQogIDE5ICAgICAgICAgICAgICAgICBzcGxfZ2V0X2xvYWRfYnVm
ZmVyKC1zaXplb2YoKmhlYWRlciksIHNpemVvZigqaGVhZGVyKSk7CiAgMjAgICAgICAgICB1bG9u
ZyBiYXNlX29mZnNldCwgaW1hZ2Vfb2Zmc2V0LCBvdmVyaGVhZDsKICAyMSAgICAgICAgIGludCBy
ZWFkLCByZXQ7CiAgMjIKICAyMyAgICAgICAgIGxvZ19kZWJ1ZygiXG5sb2FkaW5nIGhkciBmcm9t
ICVseCB0byAlcFxuIiwgKHVsb25nKW9mZnNldCwgCmhlYWRlcik7CiAgMjQgICAgICAgICByZWFk
ID0gaW5mby0+cmVhZChpbmZvLCBvZmZzZXQsIEFMSUdOKHNpemVvZigqaGVhZGVyKSwKICAyNSAK
c3BsX2dldF9ibF9sZW4oaW5mbykpLCBoZWFkZXIpOwoiCgpUaGUgaGVhZGVyIGlzIGxvYWRlZCBh
dCBDT05GSUdfVEVYVF9CQVNFIC0gc2l6ZW9mKCpoZWFkZXIpLiBJZiAKQ09ORklHX1RFWFRfQkFT
RSBpcyBzdGFydCBvZiBEUkFNIHdpdGggbm8gdXNhYmxlIG1lbW9yeSByaWdodCBiZWxvdyBpdCAK
QU5EIHNpemVvZigqaGVhZGVyKSBpcyBub24temVybywgdGhlbiB0aGlzIGxvYWRpbmcgd2lsbCBm
YWlsLgoKVGhhdCdzIHdoeSB0aGUgVEVYVF9CQVNFIGlzIHNoaWZ0ZWQgYSBiaXQgaGlnaGVyIGlu
IHRoaXMgcGF0Y2guCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
