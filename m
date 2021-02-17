Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB89731D738
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Feb 2021 11:02:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACE96C5718A;
	Wed, 17 Feb 2021 10:02:18 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 514BDC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 10:02:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DgYKj60Cdz1qsbS;
 Wed, 17 Feb 2021 11:02:17 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DgYKj5Pjsz1r14H;
 Wed, 17 Feb 2021 11:02:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id lNHWunLWxmwd; Wed, 17 Feb 2021 11:02:16 +0100 (CET)
X-Auth-Info: xT1vJqpNh00L/RhZ1cxkLFQR28CuYswIqDUspcy7n1w=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 17 Feb 2021 11:02:16 +0100 (CET)
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20210210141759.5641-1-patrice.chotard@foss.st.com>
 <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
 <7b665909-b1d6-323c-f6a4-4221fca616c7@foss.st.com>
 <7b1e8706-8fa3-44e3-4bed-ff418e9d803d@denx.de>
 <457ca91c-8fd3-929c-be24-90b7d0d87670@foss.st.com>
 <df8a5842-0f25-35b2-c7fc-a767e9f493d8@denx.de>
 <e6774c57-0000-024f-287b-3cd64575e5c8@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3780a92e-943b-6d52-8296-8500c72eae24@denx.de>
Date: Wed, 17 Feb 2021 11:02:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e6774c57-0000-024f-287b-3cd64575e5c8@foss.st.com>
Content-Language: en-US
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: gadget: dwc2_udc_otg: Fix
	dwc2_gadget_start()
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

T24gMi8xNy8yMSA5OjU3IEFNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gSGkgTWFyZWsKCkhp
LAoKWy4uLl0KCj4+PiBAQCAtMzE5LDEyICszMTgsMTEgQEAgc3RhdGljIGludCBkd2MyX2dhZGdl
dF9zdGFydChzdHJ1Y3QgdXNiX2dhZGdldCAqZywKPj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBkd2My
X3VkYyAqZGV2ID0gdGhlX2NvbnRyb2xsZXI7Cj4+PiAgwqAgwqDCoMKgwqDCoCBkZWJ1Z19jb25k
KERFQlVHX1NFVFVQICE9IDAsICIlczogJXNcbiIsIF9fZnVuY19fLCAibm8gbmFtZSIpOwo+Pj4g
IMKgIMKgwqDCoMKgwqAgaWYgKCFkcml2ZXIgfHwKPj4+IC3CoMKgwqDCoMKgwqDCoCAoZHJpdmVy
LT5zcGVlZCAhPSBVU0JfU1BFRURfRlVMTCAmJgo+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgZHJpdmVy
LT5zcGVlZCAhPSBVU0JfU1BFRURfSElHSCkgfHwKPj4+ICvCoMKgwqDCoMKgwqDCoCBkcml2ZXIt
PnNwZWVkIDwgVVNCX1NQRUVEX0ZVTEwgfHwKPj4KPj4gVGhlIERXQzIgY2FuJ3Qgb3BlcmF0ZSBp
biBMUyBnYWRnZXQgbW9kZSAsIGkuZS4gZW11bGF0ZSBzb21lIG9sZCBrZXlib2FyZCA/IE1heWJl
IHdoYXQgeW91IHdhbnQgaXMgZHJpdmVyLT5zcGVlZCA+IFVTQl9TUEVFRF9ISUdIIGluc3RlYWQg
Pwo+IFRoZSB0ZXN0IGlzIGNvcnJlY3QsIGluIGNhc2UgZHJpdmVyLT5zcGVlZCBpcyBsb3dlciB0
aGFuIEZTLCB3ZSByZXR1cm4gLUVJTlZBTC4KPiBBbGwgb3RoZXJzIHNwZWVkIEZTL0hTL1NTIGFu
ZCBoaWdoZXIgYXJlIGFsbG93ZWQuCgpXaGF0J3MgdGhlIHByb2JsZW0gd2l0aCBMUyA/CgpbLi4u
XQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
