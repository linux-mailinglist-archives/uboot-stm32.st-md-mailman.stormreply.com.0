Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8602D30F6
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 18:26:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECCFCC3FADB;
	Tue,  8 Dec 2020 17:26:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F175C3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Dec 2020 17:26:45 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Cr6YK2LGQz1rxw2;
 Tue,  8 Dec 2020 18:26:45 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Cr6YK1d2Tz1qryX;
 Tue,  8 Dec 2020 18:26:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OBOXdJnqBdJ0; Tue,  8 Dec 2020 18:26:44 +0100 (CET)
X-Auth-Info: vaNhD0emjhIVk+rK4E1iO2U/Gw17jS1FiE8J02GbOdk=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  8 Dec 2020 18:26:44 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20201201102920.84051-1-marex@denx.de>
 <22668d9b2add43d5bb75f50862baf2f6@SFHDAG2NODE3.st.com>
 <01f3a78a-6cb5-560c-63e6-e0b94629e098@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <979eac17-8320-068b-9691-0353bcd57545@denx.de>
Date: Tue, 8 Dec 2020 18:26:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <01f3a78a-6cb5-560c-63e6-e0b94629e098@foss.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [Uboot-stm32] FW: [PATCH 1/4] ARM: dts: stm32: Enable internal
 pull-ups for SDMMC1 on DHCOM SoM
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

T24gMTIvOC8yMCA2OjIwIFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIE1hcmVrLAoK
SGksCgpbLi4uXQoKPiBGb3IgdGhlIHNlcmllOsKgIHRoZSB0YXJnZXQgaXMgbmV4dCBvciBpdCBp
cyBhIGJ1Z2ZpeCBmb3IgbWFzdGVyIC8gCj4gdjIwMjEuMDEgPwoKVGhpcyBpcyBmb3IgMjAyMS4w
MSAsIGl0IGNvcnJlY3RzIGEgY291cGxlIG9mIHJhbmRvbSB0aGluZ3MgaGVyZSBhbmQgdGhlcmUu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
