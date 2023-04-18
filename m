Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDBB6E606C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 13:53:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BB1FC6A5FA;
	Tue, 18 Apr 2023 11:53:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B76DC69065
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 11:53:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CCA6D85B08;
 Tue, 18 Apr 2023 13:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681818794;
 bh=tjrzHw0Hvr9LPjeICvfeG/No9U7i0JsCsTRQU81H+/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oBi77JgVZts+a1J5xc7itdax2XMFgWd0d6UKOiD+KfbVPneVWl2R5EiXGQqTBF2o+
 GA/uigockeMWDNwsNrQMMjMpzGAgLc5uqa0QqSc9QFv2L8RLB8ipoNWOXdCsJG7/9L
 oIPIqttHHRj3X9+Shr8sS8EA5ZCr2xZcJedMpt0ixQbFPSL/zySQWUCpgBOC79YkCi
 QTnfhgi4Q0qO/0Ii//rKq6gtW+7SjFXm/R2xX8jQ6UeRkXt4uqw7EHKDFisE6Hawkt
 AAz24u/affkjMAMs6ZwCwqclmZ4MyHPtCSBeBBHq/QejnCsCVhKs/HJuWYsVT6mRgP
 dVilNxX8tv+5g==
Message-ID: <208da22c-5cc6-d449-e691-18805ad734e2@denx.de>
Date: Tue, 18 Apr 2023 13:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
References: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
 <d3e391f5-ce85-e5f9-41e4-81e271db8deb@denx.de>
 <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
 <CAOMZO5DywMdsqdVc_0gF7ADtgT7R2OCfVqW2nTjDMabFqy-SmA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAOMZO5DywMdsqdVc_0gF7ADtgT7R2OCfVqW2nTjDMabFqy-SmA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: onboard-hub: Don't disable regulator
 in remove() callback
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

T24gNC8xOC8yMyAxMzo0OSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBQYXRyaWNlIGFuZCBN
YXJlaywKPiAKPiBPbiBUdWUsIEFwciAxOCwgMjAyMyBhdCA0OjIy4oCvQU0gUGF0cmljZSBDSE9U
QVJECj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4+PiBJc24ndCB0
aGUgcmVndWxhdG9yIGVuYWJsZS9kaXNhYmxlIHJlZmNvdW50ZWQgPwo+Pgo+PiBUaGVyZSBpcyBu
byByZWZjb3VudCBvbiByZWd1bGF0b3IgdGhhdCdzIHdoeSB3ZSBsZXQgcmVndWxhdG9yIGVuYWJs
ZS4KPiAKPiBUaGVyZSBpcyBhIHJlY2VudCBwYXRjaCBmcm9tIEV1Z2VuIHRoYXQgYWRkcyByZWd1
bGF0b3IgcmVmY291bnQgc3VwcG9ydDoKPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy91LWJv
b3QvMjAyMzAzMzEwOTE1NDkuMTQ5MDk1LTEtZXVnZW4uaHJpc3RldkBjb2xsYWJvcmEuY29tLwoK
VGhhdCdzIG5pY2UgIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
