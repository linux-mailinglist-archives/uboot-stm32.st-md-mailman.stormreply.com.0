Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC5412FAA
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 09:49:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F255C5A4CC;
	Tue, 21 Sep 2021 07:49:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06130C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 07:49:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L7AXsa007683; 
 Tue, 21 Sep 2021 09:48:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=3SmJagT+5FBMLOR3mg9VohdJxEDfq02J3D2gGPV4EuY=;
 b=y/ViW7K1mGujhDaE/p69w+R0ftLcu/y/9liZUotvigQIc9UhP5u3e62KlsDmCeL23oNp
 EzZufyZfmJQ9V3U9x21PK6OehbX3KpykYoV5NhqY8c3mQsNhfZ4s1G168JeAd8cm2oIC
 3iyMpDAaob9l0SrqeqHF8YSuktlAUb969HHAEDuxTBzTc/sGegAQ6zjqSdMX3ieuDLuG
 pYj/QpWaihY4OQc6mksv7QpOgA6npHxPD3BCCmGyULu8oj82IP5WPrTQ7w7JIM26cdpH
 YCzo8OC1cZTokcdMbhpJdckxQkvO6fHsPd/j0O8/zSXhIcufbW3TeAxkE+weWIWYYO+G qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b7as5068p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:48:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6ADE10002A;
 Tue, 21 Sep 2021 09:48:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DD9721CA9F;
 Tue, 21 Sep 2021 09:48:58 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 09:48:58 +0200
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <8a963f05-04d3-c9cc-ccc2-e58b0e83b6f9@foss.st.com>
Date: Tue, 21 Sep 2021 09:48:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.10 =
 u-boot-stm32-20210921
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

SGkgVG9tLAoKUGxlYXNlIHB1bGwgdGhlIFNUTTMyIHJlbGF0ZWQgZml4ZXMgZm9yIHUtYm9vdC9t
YXN0ZXIsIHYyMDIxLjEwOiAKdS1ib290LXN0bTMyLTIwMjEwOTIxCgotIHN0bTMybXAxNTogZml4
IHRoZSB1c2VkIHBhcnRpdGlvbiBuYW1lIGZvciBVLUJvb3QgZW52aXJvbmVtZW50IHdpdGggU1BM
CgpDSSBzdGF0dXM6IApodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3Ut
Ym9vdC1zdG0vLS9waXBlbGluZXMvOTE5NwoKVGhhbmtzLApQYXRyaWNrCgpnaXQgcmVxdWVzdC1w
dWxsIG9yaWdpbi9tYXN0ZXIgCmh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L2N1c3RvZGlh
bnMvdS1ib290LXN0bS5naXQvIAp1LWJvb3Qtc3RtMzItMjAyMTA5MjEKCgoKVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBlM2Y1ZWRmNjU5MTZhODgxYjcxZWVhNTRmNDc1YzdhNGJh
ZTg1NjVjOgoKIMKgIE1lcmdlIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L2N1c3RvZGlh
bnMvdS1ib290LW1hcnZlbGwgCigyMDIxLTA5LTIwIDA4OjQ1OjI2IC0wNDAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAgaHR0cHM6Ly9zb3VyY2UuZGVueC5k
ZS91LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtLmdpdC8gCnRhZ3MvdS1ib290LXN0bTMyLTIw
MjEwOTIxCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gY2YzOWQwYzI5ZGNmMzMyZDcw
NTVkMDU0NWZjOTVlMzM3OWQ5MWE2MjoKCiDCoCBhcm06IGR0czogc3RtMzJtcDE6IHVzZSBzc2Js
IHBhcnRpdGlvbiBuYW1lIGZvciBVLUJvb3QgKDIwMjEtMDktMjEgCjA5OjIyOjAxICswMjAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQotIHN0bTMybXAxNTogZml4IHRoZSB1c2VkIHBhcnRpdGlvbiBuYW1lIGZvciBVLUJv
b3QgZW52aXJvbmVtZW50IHdpdGggU1BMCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBhdHJpY2sgRGVsYXVuYXkgKDEpOgog
wqDCoMKgwqDCoCBhcm06IGR0czogc3RtMzJtcDE6IHVzZSBzc2JsIHBhcnRpdGlvbiBuYW1lIGZv
ciBVLUJvb3QKCiDCoGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1kazEtdS1ib290LmR0c2kgfCA0
ICsrKy0KIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWVkMS11LWJvb3QuZHRzaSB8IDQgKysr
LQogwqAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMy
IG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290
LXN0bTMyCg==
