Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD4372BAC
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 May 2021 16:08:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66628C59783;
	Tue,  4 May 2021 14:08:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DB98C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 14:08:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144E6c0U007922; Tue, 4 May 2021 16:07:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jPBZHM1wr405EfLXVS9oiweQ7XR4oXcf3/pi3v/dRBk=;
 b=gOWR9W57VqDly0pZH5fa9G5w7qN+jgi5gGrgYhdzunU4ZXAcKsQaNbIX02sSg3P1MmWu
 LCqdzuPCWBIhAIL+gtPlXT3vpsYZ7H+RyjnulX/UujpWgqGLv1z6zs700X8oJKiAwLYC
 Ws27GEeLiOp05UBxb5dYj5orKPo74ZFBD6xK3EpkOTCxdfiMVAZxS4FTAIrQGfZJInQj
 OEcF162WCt3pmmI2/WVHxkStTW9j9LTRK9VOda108QIo4FVxTsDCs/c/trhK/c4tPiYZ
 GR8v6HQxgSdV5Zz7140oaLMhtrqZHPBrWGFgtpy9aV+GIHL4vV/dC+mgdD0+8SfIWoUP oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38b4yw0x70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 16:07:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB00310002A;
 Tue,  4 May 2021 16:07:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEF9A231DE7;
 Tue,  4 May 2021 16:07:58 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 16:07:58 +0200
To: Grzegorz Szymaszek <gszymaszek@short.pl>
References: <YH3EKEuGy1topHtJ@nx64de-df6d00>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <5ac1e0d8-26f4-2030-54a4-6cff22ac1106@foss.st.com>
Date: Tue, 4 May 2021 16:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YH3EKEuGy1topHtJ@nx64de-df6d00>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_08:2021-05-04,
 2021-05-04 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp157c-odyssey-som: enable
 the RNG1
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

SGksCgpPbiA0LzE5LzIxIDc6NTUgUE0sIEdyemVnb3J6IFN6eW1hc3playB3cm90ZToKPiBFbmFi
bGUgdGhlIHRydWUgcmFuZG9tIG51bWJlciBnZW5lcmF0b3IuIEl0IGNhbiBiZSB1c2VkLCBmb3Ig
ZXhhbXBsZSwgdG8KPiBnZW5lcmF0ZSBwYXJ0aXRpb24gVVVJRHMgd2hlbiBwYXJ0aXRpb25pbmcg
d2l0aCB0aGUgZ3B0IGNvbW1hbmQuIFRoZQo+IGdlbmVyYXRvciBpcyBhbHJlYWR5IGVuYWJsZWQg
aW4gdGhlIGRldmljZSB0cmVlcyBvZiBzZXZlcmFsIG90aGVyCj4gU1RNMzJNUDHigJBiYXNlZCBi
b2FyZHMsIGxpa2UgREt4IG9yIERIQ09NLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3J6ZWdvcnogU3p5
bWFzemVrIDxnc3p5bWFzemVrQHNob3J0LnBsPgo+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1v
ZHlzc2V5LXNvbS5kdHNpIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29t
LmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQo+IGluZGV4
IDgzZmYyZTdjZTEuLmUzNjdhMzExYzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMy
bXAxNTdjLW9keXNzZXktc29tLmR0c2kKPiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mt
b2R5c3NleS1zb20uZHRzaQo+IEBAIC0yNTgsNiArMjU4LDEwIEBACj4gICAJc3RhdHVzID0gIm9r
YXkiOwo+ICAgfTsKPiAgIAo+ICsmcm5nMSB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4g
Kwo+ICAgJnNkbW1jMiB7Cj4gICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgIm9wZW5kcmFp
biIsICJzbGVlcCI7Cj4gICAJcGluY3RybC0wID0gPCZzZG1tYzJfYjRfcGluc19hPjsKCgpSZXZp
ZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
ClRoYW5rcwpQYXRyaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
