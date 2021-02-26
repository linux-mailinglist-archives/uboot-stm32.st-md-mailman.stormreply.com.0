Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F7D326634
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 18:17:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35077C57189;
	Fri, 26 Feb 2021 17:17:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BA30C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 17:17:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QHHbx9026174; Fri, 26 Feb 2021 18:17:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=12KIlHnbsjzue6H6eCp7SrFboWpyFw46BxeeWEcISrs=;
 b=HXNBjGg0a2sqgIr7I2lHV7xKzh0hxlKYuAvisvfVsARNpF+5RoB5wn2zSSG4pWY1KU6i
 YRa+vYEijOo+vJPpwHU8P6E/oqyB7pY5UNqtDpzFGGP5K4+jEaUWn3ZzFRG8XvuhUrid
 dGhT94jYpjlOa7tXRmUYkLPKbohSKbQs0+sOWW7O+sGlmbFDcpEGlm/SmJHE9hnzXOPZ
 gu83FuaRZV3P/CRWTpfasbSETAwRqrzpAyI9JNhEAQ34eYtWQMjphxq+aIoJkRPPm2tx
 4uKJvDL/WKxGJ7CePzuKIKcu9hheEEUnacPlbCCXKua1h7uPT7Y+WQJADupLrY3qcQbv KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66yf12k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 18:17:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E134210002A;
 Fri, 26 Feb 2021 18:17:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC33A25D037;
 Fri, 26 Feb 2021 18:17:34 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 18:17:34 +0100
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <63f51866-2ee6-5206-8f07-02a266be123e@foss.st.com>
Date: Fri, 26 Feb 2021 18:17:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_05:2021-02-26,
 2021-02-26 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.04 =
 u-boot-stm32-20210226
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

CkhpIFRvbSwKClBsZWFzZSBwdWxsIHRoZSBTVE0zMiByZWxhdGVkIHBhdGNoZXMgZm9yIHUtYm9v
dC9tYXN0ZXIsIHYyMDIxLjA0OiAKdS1ib290LXN0bTMyLTIwMjEwMjI2CgotIEFkZCBVU0IgaG9z
dCBib290IHN1cHBvcnQgaW4gc3RtMzJtcDEgY29uZmlnCi0gRW5hYmxlIHVlZmkgcmVsYXRlZCBj
b21tYW5kcyBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAxNSBib2FyZHMKLSBSZW1vdmUg
ZHVwbGljYXRlIHVhcnQgbm9kZXMgaW4gc3RtMzJtcDE1IGRldmljZSB0cmVlCgpDSSBzdGF0dXM6
IApodHRwczovL2dpdGxhYi5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0vLS9w
aXBlbGluZXMvNjUzMwoKVGhhbmtzLApQYXRyaWNrCgoKZ2l0IHJlcXVlc3QtcHVsbCBvcmlnaW4v
bWFzdGVyIApodHRwczovL2dpdGxhYi5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1z
dG0uZ2l0IAp1LWJvb3Qtc3RtMzItMjAyMTAyMjYKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgYzI4ZDVkNzA0ZDMzNDdmY2JlNWU0OWFiNTYxOTczYzAwYmY5MzM3ZjoKCiDCoCBN
ZXJnZSBicmFuY2ggJzIwMjEtMDItMjUtcmVtb3ZlLXBsYXRmb3JtcycgKDIwMjEtMDItMjUgMTM6
MTg6MjcgLTA1MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiDC
oCBodHRwczovL2dpdGxhYi5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0uZ2l0
IAp1LWJvb3Qtc3RtMzItMjAyMTAyMjYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAx
YjNkYjM0OWMwMTFlNzkwNWEwMzEyNmQ5YTc4ZTFmYjk4ODZlZmI3OgoKIMKgIGNvbmZpZ3M6IHN0
bTMybXAxOiBlbmFibGUgdWVmaSByZWxhdGVkIGNvbW1hbmRzICgyMDIxLTAyLTI2IDE1OjQ1OjIy
IAorMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KLSBBZGQgVVNCIGhvc3QgYm9vdCBzdXBwb3J0IGluIHN0bTMybXAx
IGNvbmZpZwotIEVuYWJsZSB1ZWZpIHJlbGF0ZWQgY29tbWFuZHMgZm9yIFNUTWljcm9lbGVjdHJv
bmljcyBTVE0zMk1QMTUgYm9hcmRzCi0gUmVtb3ZlIGR1cGxpY2F0ZSB1YXJ0IG5vZGVzIGluIHN0
bTMybXAxNSBkZXZpY2UgdHJlZQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbGlhcyBBcGFsb2RpbWFzICgxKToKIMKgwqDC
oMKgwqAgY29uZmlnczogc3RtMzJtcDE6IGVuYWJsZSB1ZWZpIHJlbGF0ZWQgY29tbWFuZHMKCk1h
cmVrIFZhc3V0ICgxKToKIMKgwqDCoMKgwqAgQVJNOiBzdG0zMjogQWRkIFVTQiBob3N0IGJvb3Qg
c3VwcG9ydAoKUGF0cmljayBEZWxhdW5heSAoMSk6CiDCoMKgwqDCoMKgIGFybTogZHRzOiBzdG0z
Mm1wMTU6IHJlbW92ZSBkdXBsaWNhdGUgdWFydCBub2RlcwoKIMKgYXJjaC9hcm0vZHRzL3N0bTMy
bXAxNS1waW5jdHJsLmR0c2kgfCA4MCAKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogwqBjb25maWdzL3N0bTMybXAxNV9i
YXNpY19kZWZjb25maWfCoMKgIHzCoCAzICsrKwogwqBjb25maWdzL3N0bTMybXAxNV90cnVzdGVk
X2RlZmNvbmZpZyB8wqAgMyArKysKIMKgaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmjCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDcgKysrKysrCiDCoDQgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgODAgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
