Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 336665B1EE4
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 15:27:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1C86C64107;
	Thu,  8 Sep 2022 13:27:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CBF4C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 13:27:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 57DFD84AFA;
 Thu,  8 Sep 2022 15:27:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1662643675;
 bh=HuzgN6ecUTipUPAh+y0v8wMLMeALp6DTpfvM7DzA56E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I28yLg0qCiUUuICkjL4dDkTtp81yTbgrWKU2A5fSXsYnE2wVZhWSi9Lt1EoM8nzd1
 Yzro9BtF6f9aSllKAjd5t32Bu4Sx8qZFTFTGoNcfo95vooENK8nQ+KpGtOykn1YOea
 jlIHesj1ary5WXZ7QRCHiEGfM1eG8d7CYK1rPfUkhFM4B/N1zYGsvgkYLGUq/DgiEI
 Zf5IZot4W/QL5GpUcA3OIRGt7SqWT94dAZ4kKfL6ADlxxkE6cyIWM61kk12U6wtI7n
 57aF/Wyp8Hmd0AzSC62Jdz1inO/mEy7S71utb08h84JVWmO8opSZBUAgOPwOgXBifT
 Benp0aum+gnPg==
Message-ID: <3dc5dfd6-f787-7182-8ccf-18ff9208cc0a@denx.de>
Date: Thu, 8 Sep 2022 13:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220704124540.1.Ic02e6fb44225d1cfe15506c7c85f70a0893fb880@changeid>
 <20220704124540.2.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
 <0e84778e-0ac5-5547-5a29-c8d12df3498d@denx.de>
 <4dda40ad-4025-e4e2-4296-c85227369db4@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4dda40ad-4025-e4e2-4296-c85227369db4@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] usb: hub: increase
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

T24gOS84LzIyIDEzOjIwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgoKWy4uLl0KCj4+PiBkaWZm
IC0tZ2l0IGEvY29tbW9uL3VzYl9odWIuYyBiL2NvbW1vbi91c2JfaHViLmMKPj4+IGluZGV4IGQ3
MzYzODk1MGI5Li5lNjgxZjFiMzA3MyAxMDA2NDQKPj4+IC0tLSBhL2NvbW1vbi91c2JfaHViLmMK
Pj4+ICsrKyBiL2NvbW1vbi91c2JfaHViLmMKPj4+IEBAIC00Nyw3ICs0Nyw3IEBACj4+PiDCoCAj
ZGVmaW5lIEhVQl9TSE9SVF9SRVNFVF9USU1FwqDCoMKgIDIwCj4+PiDCoCAjZGVmaW5lIEhVQl9M
T05HX1JFU0VUX1RJTUXCoMKgwqAgMjAwCj4+PiDCoCAtI2RlZmluZSBIVUJfREVCT1VOQ0VfVElN
RU9VVMKgwqDCoCAxMDAwCj4+PiArI2RlZmluZSBIVUJfREVCT1VOQ0VfVElNRU9VVMKgwqDCoCAy
MDAwCj4+Cj4+IERvIHlvdSB0aGluayBpdCBpcyBwb3NzaWJsZSB0byBtYWtlIHRoaXMgc29tZWhv
dyBkeW5hbWljICwgc28gbm90IGFsbCAKPj4gZGV2aWNlcyB3b3VsZCB3YWl0IHNvIGxvbmcgPwo+
IAo+IAo+IFllcyBJIGRvIGl0IGluIFYyLgpUaGFuayB5b3UKCk1heWJlIHRoaXMgc2hvdWxkIGJl
IGEgRFQgcHJvcGVydHkgb2Ygc29tZSByZWd1bGF0b3Igb3Igc29tZSBzdWNoLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
