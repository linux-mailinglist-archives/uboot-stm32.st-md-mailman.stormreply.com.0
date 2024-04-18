Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEE88A98E9
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Apr 2024 13:48:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23BA8C6C859;
	Thu, 18 Apr 2024 11:48:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED333C6C858
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 11:48:13 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-349bd110614so134093f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713440893; x=1714045693;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ElF1XMui5QmKTnb7hArcBvbOESOqRBGt2SJ9WGI7Z34=;
 b=cr7s3tULCam8x8g8mAiL1hRsS/LMSvBHpatONM7QRR+k9UlymAAPYR2P7rzJc/YNzT
 XM5xLHH56VTICeMxIegLFVNH2fl+b52XmgUL4b1/4cUIFlYi4uxT4g/lqsEjBMMMoeCc
 zf+GOoCN0d4jhceVXeIRStj+cStLDq6/tk8nCQymL0O0w09D58IvLxVHSI6gxKkCmugl
 LeY7X3caO5ADkvKT1fWiireyrG1MfZ4r+jiPqHP1FZQDrTxIHbr208ZL11FgSCBJzgRO
 wpDs6Ux0biYg0mQ3AO5KyTeb9tjaY2Lfyy/TA29diR67GXcFNjRq1A8yFIVuXLlqAgmT
 Nayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713440893; x=1714045693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ElF1XMui5QmKTnb7hArcBvbOESOqRBGt2SJ9WGI7Z34=;
 b=R4nKsFO2Xy7ILSRb7YdDMngV28uE71lFapCPtCOqqypRbBYpGR+M6RCzSpKsI7AYQo
 Zy6Tjb/IKtKz5piCho8osIp6tO3A89X9g6fdADo/LRRAipvP0bDvXJtba+mKa8GG6q15
 svnOblnUptevB8TySU1YZCVmm5B/lOrx3Ss4QlYmdTm1xhmvQXEktH2qSPBe+MOrfWdV
 7mdr04WV6Y+TobfUZ05dzVZNLEe7tdsLksMUH/y6OvCfm4Qu9Fw46MjVU0gOAzzq6eOL
 /Nh9wyQQ81uy050bc81KBcp0tNsSO9MvIw8R4Kr6v6O7CsSsO+NxqQ5qikaLxCDBaXEf
 Qz9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKJUFLUKIKqzS5UtFBp0m5PLWQO+tvbdICmtQ2QLYXrxBIqr/ucOTKwgYDhWnUugXhTgLVsG68vjrbChQMEkZoa5asmhZkJQSY5kwN/WbL5Wnty+BSXgag
X-Gm-Message-State: AOJu0YyCs/W+DFl2Y1apa93NO14psMdRoBb5df6hoLHI/xoXTQ+AZGk0
 V+8zBd/HzDQXZ+1jb41APXlx/JXwwg1UaIO81HIa33+1LVwJE4ywF3fHucwwsuUFwl3gxIdv6vU
 fYf7KCaz92QYju8dY/ANeE01Qu3U=
X-Google-Smtp-Source: AGHT+IFWhKsheksLnm06zQsZ6wqD49a+t7P1GXwqm6MSnXxSeY/HZ0w0mF9fsob/n64yWSx0RGNQamLQYd/xC73U2SQ=
X-Received: by 2002:a05:600c:4f51:b0:418:73d1:94e9 with SMTP id
 m17-20020a05600c4f5100b0041873d194e9mr1695520wmq.4.1713440893052; Thu, 18 Apr
 2024 04:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-2-patrice.chotard@foss.st.com>
In-Reply-To: <20240409150215.2497778-2-patrice.chotard@foss.st.com>
From: Igor Opaniuk <igor.opaniuk@gmail.com>
Date: Thu, 18 Apr 2024 13:48:01 +0200
Message-ID: <CAByghJa_3MwcY74oNR0cKA2+XOA6R6J8LGhnecvZoJr_ONxTXw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 01/25] configs: stm32mp13: Enable
	FASTBOOT
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

T24gVHVlLCBBcHIgOSwgMjAyNCBhdCA1OjE54oCvUE0gUGF0cmljZSBDaG90YXJkCjxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gRW5hYmxlIEZBU1RCT09UIHJlbGF0aXZl
IGZsYWdzIGZvciBzdG0zMm1wMTNfZGVmY29uZmlnLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4KPiAtLS0KPgo+ICBjb25m
aWdzL3N0bTMybXAxM19kZWZjb25maWcgfCA5ICsrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9z
dG0zMm1wMTNfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnCj4gaW5kZXgg
Yzg5M2UyNzJkYjkuLmRiMDllNjMxMDBlIDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDEz
X2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZwo+IEBAIC0xNSw2
ICsxNSw3IEBAIENPTkZJR19DTURfU1RNMzJQUk9HPXkKPiAgQ09ORklHX1NZU19MT0FEX0FERFI9
MHhjMjAwMDAwMAo+ICBDT05GSUdfU1lTX01FTVRFU1RfU1RBUlQ9MHhjMDAwMDAwMAo+ICBDT05G
SUdfU1lTX01FTVRFU1RfRU5EPTB4YzQwMDAwMDAKPiArIyBDT05GSUdfQU5EUk9JRF9CT09UX0lN
QUdFIGlzIG5vdCBzZXQKPiAgQ09ORklHX0ZJVD15Cj4gIENPTkZJR19TWVNfQk9PVE1fTEVOPTB4
MjAwMDAwMAo+ICBDT05GSUdfRElTVFJPX0RFRkFVTFRTPXkKPiBAQCAtNTMsNiArNTQsMTMgQEAg
Q09ORklHX1NZU19NTUNfRU5WX0RFVj0tMQo+ICBDT05GSUdfRU5WX01NQ19VU0VfRFQ9eQo+ICBD
T05GSUdfQ0xLX1NDTUk9eQo+ICBDT05GSUdfU0VUX0RGVV9BTFRfSU5GTz15Cj4gK0NPTkZJR19V
U0JfRlVOQ1RJT05fRkFTVEJPT1Q9eQo+ICtDT05GSUdfRkFTVEJPT1RfQlVGX0FERFI9MHhjMDAw
MDAwMAo+ICtDT05GSUdfRkFTVEJPT1RfQlVGX1NJWkU9MHgwMjAwMDAwMAo+ICtDT05GSUdfRkFT
VEJPT1RfRkxBU0g9eQo+ICtDT05GSUdfRkFTVEJPT1RfRkxBU0hfTU1DX0RFVj0wCj4gK0NPTkZJ
R19GQVNUQk9PVF9DTURfT0VNX0ZPUk1BVD15Cj4gK0NPTkZJR19GQVNUQk9PVF9DTURfT0VNX1BB
UlRDT05GPXkKPiAgQ09ORklHX0dQSU9fSE9HPXkKPiAgQ09ORklHX0RNX0kyQz15Cj4gIENPTkZJ
R19TWVNfSTJDX1NUTTMyRjc9eQo+IEBAIC05Miw3ICsxMDAsNiBAQCBDT05GSUdfVVNCX0dBREdF
VF9NQU5VRkFDVFVSRVI9IlNUTWljcm9lbGVjdHJvbmljcyIKPiAgQ09ORklHX1VTQl9HQURHRVRf
VkVORE9SX05VTT0weDA0ODMKPiAgQ09ORklHX1VTQl9HQURHRVRfUFJPRFVDVF9OVU09MHg1NzIw
Cj4gIENPTkZJR19VU0JfR0FER0VUX0RXQzJfT1RHPXkKPiAtQ09ORklHX1VTQl9HQURHRVRfRE9X
TkxPQUQ9eQo+ICBDT05GSUdfRVJSTk9fU1RSPXkKPiAgIyBDT05GSUdfTE1CX1VTRV9NQVhfUkVH
SU9OUyBpcyBub3Qgc2V0Cj4gIENPTkZJR19MTUJfTUVNT1JZX1JFR0lPTlM9Mgo+IC0tCj4gMi4y
NS4xCj4KUmV2aWV3ZWQtYnk6IElnb3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQGdtYWlsLmNvbT4K
Ci0tIApCZXN0IHJlZ2FyZHMgLSBBdGVudGFtZW50ZSAtIE1laWxsZXVyZXMgc2FsdXRhdGlvbnMK
Cklnb3IgT3Bhbml1awoKbWFpbHRvOiBpZ29yLm9wYW5pdWtAZ21haWwuY29tCnNreXBlOiBpZ29y
Lm9wYW55dWsKaHR0cHM6Ly93d3cubGlua2VkaW4uY29tL2luL2lvcGFuaXVrCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
