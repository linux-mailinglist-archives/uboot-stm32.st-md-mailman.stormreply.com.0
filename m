Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61D6E8F39
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Apr 2023 12:07:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44559C65048;
	Thu, 20 Apr 2023 10:07:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51C92C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Apr 2023 10:07:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6782C862E0;
 Thu, 20 Apr 2023 12:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681985241;
 bh=l+4MZ6Q8M0Zvrmsh2dmDPl3DTEve+nES8W1KM6B6Vx8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dh38ZSa7yF8X4+FAMxPegHF/gZUgud+FnU8MqSCt7YwOnFUvLngMFWlH/R1mSIo4I
 oQBiViWyQ4uZgNCeiWEv7DEy68eSxa6s5Psl59067xaIWtyamZ4WtGMYdbC5t0m//u
 EImqpMpKrJFYzqMZBTEhJxYCfnb1AJP013eX3U1mYu0PcsWI3+yTwqzfOfV8SrSUHv
 oDDkGooQj8tsWLE/5wxz7xjtUnjMykQZijBXxO+klp1QagXv9GWOOSOTygkwML1Bmq
 n1NgshQ2mtdJK6c9iMamUQeuBzdCEdEAMcqwbnBGs/14RJvTkL7k9aDzRUcW6MdWYY
 EN3ZS4fh1l9Mg==
Message-ID: <8b6876cd-9c08-5489-a390-4b471be339a5@denx.de>
Date: Thu, 20 Apr 2023 12:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230418135941.774340-1-patrick.delaunay@foss.st.com>
 <20230418155937.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
 <eb7556d1-8283-70dd-790c-925c10ba02a0@denx.de>
 <a89618b6-df55-79cf-77be-0f250bf1040e@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a89618b6-df55-79cf-77be-0f250bf1040e@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32mp: alignment with
	v6.3-rc3
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

T24gNC8yMC8yMyAxMTowOCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKCkhpLAoKWy4u
Ll0KCj4gbm8gcmVhc29uOsKgIEl0IHdhcyB0aGUgdmVyc2lvbiBhdmFpbGFibGUgd2hlbiBJIHN0
YXJ0IHRoZSAKPiBzeW5jaHJvbml6YXRpb24uLi4uCj4gCj4gYW5kIEkgZG9uJ3Qgc2VlIG5ldyBw
YXRjaGVzIG9uIHRoZcKgIHN0bTMybXAgZGV2aWNlIHRyZWVzIHNpbmNlIHY2LjMtcmMxCj4gCj4g
YW5kIHRoZSBwdWxsIHJlcXVlc3Qgc3RtMzItZHQtZm9yLXY2LjMtMS4KPiAKPiAKPiBJIGNhbiB1
cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGlmIGl0IGlzIG5lZWRlZC4KClllcyBwbGVhc2UsIG9y
IGp1c3Qgd2FpdCB1bnRpbCBNb25kYXkgZm9yIDYuMyBmaW5hbCBhbmQgdXNlIHRoYXQuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
