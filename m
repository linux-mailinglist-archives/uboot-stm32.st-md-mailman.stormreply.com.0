Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6333D2F48AA
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 11:30:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FE3DC424BE;
	Wed, 13 Jan 2021 10:30:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 843DAC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 10:30:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DAPumT005348; Wed, 13 Jan 2021 11:30:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=UuQ1nPzimN4zFg3n4ZFjOFq8F/3uE3bWbYaKzN7qSig=;
 b=uPAMcDYyL7LGaVpBVWOVPnCKCJ+BollYTTJO61TLe/1GPaTykWk/9J7iJ++ZFxd1OUue
 8+9jAC47S4dpQrcUWpZrCnxZY9kjGSG3qnY08yXHl+wMoPQ7hN1hMS/YWcteejm7iTYB
 0lX+iRiO6jibNAKR6o3f9rt70JBWH2CGhZdDXASId3uwrqBccnfkQ0EtnuxYyE25p1rj
 mOMBgP/9oMcEDsPybNvaRAtDeSpCwgHcnv9lsdTaPmsh/k6VQQPWOO5JOIREIN7B5d+j
 8f1XSq2UShF7LdzzC52kh7NLJlrORHBfu69XE/FFzHG+yD1p8eF3tDh/qBAsbUSnL6tQ 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5h2nvp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 11:30:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB59010002A;
 Wed, 13 Jan 2021 11:30:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D6FC2349E6;
 Wed, 13 Jan 2021 11:30:44 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 11:30:41 +0100
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <f7e2366f-36be-4472-9894-e73def85bc5c@foss.st.com>
Date: Wed, 13 Jan 2021 11:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_05:2021-01-13,
 2021-01-13 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.04 =
 u-boot-stm32-20210113
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
dC9tYXN0ZXIsIHYyMDIxLjA0OiAKdS1ib290LXN0bTMyLTIwMjEwMTEzCgotIEVuYWJsZSBsb2dn
aW5nIGZlYXR1cmVzIGZvciBzdG0zMm1wMTUgYm9hcmRzCi0gVXBkYXRlIE1BSU5UQUlORVJTIGVt
YWlscyBmb3IgU1RJIGFuZCBTVE0zMgotIEFjdGl2YXRlIE9GX0xJVkUgZm9yIFNUIHN0bTMybXAx
NSBib2FyZHMKLSBTd2l0Y2ggdG8gTUNPMiBmb3IgUEhZIDUwIE1IeiBjbG9jayBmb3IgREhDT00g
Ym9hcmRzCi0gQ29ycmVjdGlvbiBpbiBzdG0zMnByb2cgY29tbWFuZCBvbiB1YXJ0OiBhbHdheXMg
Zmx1c2ggREZVIG9uIHN0YXJ0IGNvbW1hbmQKLSBVcGRhdGUgVVNCLUMgcG93ZXIgZGV0ZWN0aW9u
IGFsZ29yaXRobSBvbiBESyBib2FyZHMKCkNJIHN0YXR1czogCmh0dHBzOi8vZ2l0bGFiLmRlbngu
ZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS8tL3BpcGVsaW5lcy81ODU5CgpUaGFua3Ms
ClBhdHJpY2sKCmdpdCByZXF1ZXN0LXB1bGwgb3JpZ2luL21hc3RlciAKaHR0cHM6Ly9naXRsYWIu
ZGVueC5kZS91LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtLmdpdCAKdS1ib290LXN0bTMyLTIw
MjEwMTEzCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGVlNjcyNmJlNGYwZGNj
YjYxMmYwMTkzYzYyY2ExNDkxNjRjOGE1YWY6CgogwqAgTWVyZ2UgdGFnICd0aS12MjAyMS4wNC1y
YzEnIG9mIApodHRwczovL2dpdGxhYi5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC10
aSAoMjAyMS0wMS0xMiAwOTozMjo0OCAKLTA1MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiDCoCBodHRwczovL2dpdGxhYi5kZW54LmRlL3UtYm9vdC9jdXN0b2Rp
YW5zL3UtYm9vdC1zdG0uZ2l0IAp0YWdzL3UtYm9vdC1zdG0zMi0yMDIxMDExMwoKZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDdjY2FhMzEzODBhNGFiYjJiMjM3MTgwMDhhNTRmZTI5MTdk
YjhlZGY6CgogwqAgTUFJTlRBSU5FUlM6IFVwZGF0ZSBTVGkgYW5kIFNUTTMyIG1haW50YWluZXJz
IGVtYWlscyBpbiByZW1haW5pbmcgCmZpbGVzICgyMDIxLTAxLTEzIDA5OjUyOjU4ICswMTAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQotIEVuYWJsZSBsb2dnaW5nIGZlYXR1cmVzIGZvciBzdG0zMm1wMTUgYm9hcmRzCi0g
VXBkYXRlIE1BSU5UQUlORVJTIGVtYWlscyBmb3IgU1RJIGFuZCBTVE0zMgotIEFjdGl2YXRlIE9G
X0xJVkUgZm9yIFNUIHN0bTMybXAxNSBib2FyZHMKLSBTd2l0Y2ggdG8gTUNPMiBmb3IgUEhZIDUw
IE1IeiBjbG9jayBmb3IgREhDT00gYm9hcmRzCi0gQ29ycmVjdGlvbiBpbiBzdG0zMnByb2cgY29t
bWFuZCBvbiB1YXJ0OiBhbHdheXMgZmx1c2ggREZVIG9uIHN0YXJ0IGNvbW1hbmQKLSBVcGRhdGUg
VVNCLUMgcG93ZXIgZGV0ZWN0aW9uIGFsZ29yaXRobSBvbiBESyBib2FyZHMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWFy
ZWsgVmFzdXQgKDEpOgogwqDCoMKgwqDCoCBBUk06IGR0czogc3RtMzI6IFN3aXRjaCB0byBNQ08y
IGZvciBQSFkgNTAgTUh6IGNsb2NrCgpNaWNoYWwgU2ltZWsgKDEpOgogwqDCoMKgwqDCoCBBUk06
IHN0bTMyOiBVc2UgZmlybXdhcmUgcHJvcGVydHkgaW5zdGVhZCBvZiBsb2FkYWJsZXMKClBhdHJp
Y2UgQ2hvdGFyZCAoMik6CiDCoMKgwqDCoMKgIGJvYXJkOiBzdG0zMnBtMTogdXBkYXRlIFVTQi1D
IHBvd2VyIGRldGVjdGlvbiBhbGdvcml0aG0gb24gREsgYm9hcmRzCiDCoMKgwqDCoMKgIE1BSU5U
QUlORVJTOiBVcGRhdGUgU1RpIGFuZCBTVE0zMiBtYWludGFpbmVycyBlbWFpbHMgaW4gcmVtYWlu
aW5nIApmaWxlcwoKUGF0cmljayBEZWxhdW5heSAoMzUpOgogwqDCoMKgwqDCoCBhcm06IHN0bTMy
bXA6IG1pZ3JhdGUgdHJhY2UgdG8gbG9nIG1hY3JvCiDCoMKgwqDCoMKgIGFybTogc3RtMzJtcDog
bWlncmF0ZSBjbWRfc3RtMzJwcm9nIHRvIGxvZyBtYWNybwogwqDCoMKgwqDCoCBhcm06IHN0bTMy
bXA6IGJzZWM6IG1pZ3JhdGUgdHJhY2UgdG8gbG9nIG1hY3JvCiDCoMKgwqDCoMKgIHBpbmN0cmw6
IHN0bTMyOiBtaWdyYXRlIHRyYWNlIHRvIGxvZyBtYWNybwogwqDCoMKgwqDCoCBncGlvOiBzdG0z
Mi1ncGlvOiBtaWdyYXRlIHRyYWNlIHRvIGRldiBhbmQgbG9nIG1hY3JvCiDCoMKgwqDCoMKgIHJl
bW9wcm9jOiBzdG0zMjogbWlncmF0ZSB0cmFjZSB0byBsb2cgbWFjcm8KIMKgwqDCoMKgwqAgcmFt
OiBzdG0zMjogbWlncmF0ZSB0cmFjZSB0byBsb2cgbWFjcm8KIMKgwqDCoMKgwqAgcmFtOiBzdG0z
Mm1wMTogbWlncmF0ZSB0cmFjZSB0byBkZXYgb3IgbG9nIG1hY3JvCiDCoMKgwqDCoMKgIG1tYzog
c3RtMzJfc2RtbWMyOiBtaWdyYXRlIHRyYWNlIHRvIGRldiBhbmQgbG9nIG1hY3JvCiDCoMKgwqDC
oMKgIHRpbWVyOiBzdG0zMjogbWlncmF0ZSB0cmFjZSB0byBsb2cgbWFjcm8KIMKgwqDCoMKgwqAg
aHdzcGlubG9jazogc3RtMzI6IG1pZ3JhdGUgdHJhY2UgdG8gbG9nIG1hY3JvCiDCoMKgwqDCoMKg
IHJ0Yzogc3RtMzI6IG1pZ3JhdGUgdHJhY2UgdG8gbG9nIG1hY3JvCiDCoMKgwqDCoMKgIHdhdGNo
ZG9nOiBzdG0zMm1wOiBtaWdyYXRlIHRyYWNlIHRvIGRldiBtYWNybwogwqDCoMKgwqDCoCBwb3dl
cjogcmVndWxhdG9yOiBzdG0zMi12ZXJmYnVmOiBkZWZpbmUgTE9HX0NBVEVHT1JZCiDCoMKgwqDC
oMKgIG1pc2M6IHJjYzogbWlncmF0ZSB0cmFjZSB0byBkZXYgbWFjcm8KIMKgwqDCoMKgwqAgbWlz
YzogcmNjOiBrZWVwIHRoZSByY2MgZGV2aWNlIG5hbWUgZm9yIHN1Ym5vZGUKIMKgwqDCoMKgwqAg
Y2xrOiBzdG0zMm1wMTogbWlncmF0ZSB0cmFjZSB0byBkZXYgYW5kIGxvZyBtYWNybwogwqDCoMKg
wqDCoCBjbGs6IGNsa19zdG0zMmY6IG1pZ3JhdGUgdHJhY2UgdG8gZGV2IGFuZCBsb2cgbWFjcm8K
IMKgwqDCoMKgwqAgY2xrOiBjbGtfc3RtMzJoNzogbWlncmF0ZSB0cmFjZSB0byBkZXYgYW5kIGxv
ZyBtYWNybwogwqDCoMKgwqDCoCByZXNldDogc3RtMzItcmVzZXQ6IG1pZ3JhdGUgdHJhY2UgdG8g
ZGV2IGFuZCBsb2cgbWFjcm8KIMKgwqDCoMKgwqAgbWFpbGJveDogc3RtMzItaXBjYzogbWlncmF0
ZSB0cmFjZSB0byBkZXYgYW5kIGxvZyBtYWNybwogwqDCoMKgwqDCoCBpMmM6IHN0bTMyZjdfaTJj
OiBtaWdyYXRlIHRyYWNlIHRvIGRldiBhbmQgbG9nIG1hY3JvCiDCoMKgwqDCoMKgIHBoeTogc3Rt
MzItdXNicGh5YzogbWlncmF0ZSB0cmFjZSB0byBkZXYgYW5kIGxvZyBtYWNybwogwqDCoMKgwqDC
oCBzcGk6IHN0bTMyX3NwaTogbWlncmF0ZSB0cmFjZSB0byBkZXYgYW5kIGxvZyBtYWNybwogwqDC
oMKgwqDCoCBzcGk6IHN0bTMyX3FzcGk6IG1pZ3JhdGUgdHJhY2UgdG8gZGV2IGFuZCBsb2cgbWFj
cm8KIMKgwqDCoMKgwqAgbXRkOiBzdG0zMl9mbWMyOiBtaWdyYXRlIHRyYWNlIHRvIGRldiBhbmQg
bG9nIG1hY3JvCiDCoMKgwqDCoMKgIG1lbW9yeTogc3RtMzItZm1jMjogbWlncmF0ZSB0cmFjZSB0
byBkZXYgYW5kIGxvZyBtYWNybwogwqDCoMKgwqDCoCBzZXJpYWw6IHN0bTMyOiBkZWZpbmUgTE9H
X0NBVEVHT1JZCiDCoMKgwqDCoMKgIHZpZGVvOiBzdG0zMl9sdGRjOiBtaWdyYXRlIHRyYWNlIHRv
IGRldiBhbmQgbG9nIG1hY3JvCiDCoMKgwqDCoMKgIHZpZGVvOiBzdG0zMl9kc2k6IG1pZ3JhdGUg
dHJhY2UgdG8gZGV2IGFuZCBsb2cgbWFjcm8KIMKgwqDCoMKgwqAgYm9hcmQ6IHN0OiBzdG0zMm1w
MTogbWlncmF0ZSB0cmFjZSB0byBkZXYgYW5kIGxvZyBtYWNybwogwqDCoMKgwqDCoCBib2FyZDog
c3Q6IGNvbW1vbjogbWlncmF0ZSB0cmFjZSB0byBkZXYgYW5kIGxvZyBtYWNybwogwqDCoMKgwqDC
oCBjb25maWdzOiBzdG0zMm1wMTU6IGVuYWJsZSBMT0cgZmVhdHVyZXMKIMKgwqDCoMKgwqAgY29u
Zmlnczogc3RtMzJtcDE6IGFjdGl2YXRlIE9GX0xJVkUgZm9yIERUIGxpdmUgc3VwcG9ydAogwqDC
oMKgwqDCoCBhcm06IHN0bTMybXA6IHN0bTMycHJvZzogYWx3YXlzIGZsdXNoIERGVSBvbiBzdGFy
dCBjb21tYW5kIGZvciB1YXJ0CgogwqBhcmNoL2FybS9kdHMvc3RpaDQxMC1iMjI2MC11LWJvb3Qu
ZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KIMKgYXJjaC9h
cm0vZHRzL3N0aWg0MTAtYjIyNjAuZHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KIMKgYXJjaC9hcm0vZHRzL3N0bTMyNDI5aS1ldmFs
LXUtYm9vdC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KIMKg
YXJjaC9hcm0vZHRzL3N0bTMyZjQyOS1kaXNjby11LWJvb3QuZHRzacKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMiArLQogwqBhcmNoL2FybS9kdHMvc3RtMzJmNDY5LWRpc2NvLXUt
Ym9vdC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCiDCoGFyY2gv
YXJtL2R0cy9zdG0zMmg3NDNpLWRpc2NvLmR0c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCiDCoGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNv
bS11LWJvb3QuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjUgKysrKysrKysrKy0t
LQogwqBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20uZHRzacKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0KIMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L2Jvb3RfcGFyYW1zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCA4ICsrLS0KIMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM4IAorKysrKysrKysrLS0t
LS0tLS0tCiDCoGFyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJrZXkuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstCiDCoGFyY2gvYXJtL21hY2gtc3Rt
MzJtcC9jbWRfc3RtMzJwcm9nL2NtZF9zdG0zMnByb2cuY8KgwqDCoCB8wqDCoCA0ICstCiDCoGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJwcm9nL3N0bTMycHJvZy5jwqDCoMKgwqDCoMKg
wqAgfCAxMTIgCisrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvc3RtMzJwcm9n
LmjCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCiDCoGFyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRf
c3RtMzJwcm9nL3N0bTMycHJvZ19zZXJpYWwuYyB8wqAgMzcgCisrKysrKysrKy0tLS0tLS0tLQog
wqBhcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9zdG0zMnByb2dfdXNiLmPCoMKg
wqAgfMKgIDE0ICsrKy0tLS0KIMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NwdS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxOCArKysr
Ky0tLS0KIMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKystLQogwqBhcmNoL2FybS9tYWNo
LXN0bTMybXAvZmR0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDE3ICsrKysrLS0tLQogwqBhcmNoL2FybS9tYWNoLXN0bTMybXAvcHdy
X3JlZ3VsYXRvci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsK
IMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NwbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNiArKysrLS0tLQogwqBib2FyZC9kaGVs
ZWN0cm9uaWNzL2RoX3N0bTMybXAxL3UtYm9vdC1kaGNvbS5pdHPCoMKgwqDCoMKgwqAgfMKgwqAg
OCArKy0tCiDCoGJvYXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvdS1ib290LWRoY29yLml0
c8KgwqDCoMKgwqDCoCB8wqDCoCAyICstCiDCoGJvYXJkL3N0L2NvbW1vbi9NQUlOVEFJTkVSU8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAyICstCiDCoGJvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQogwqBib2FyZC9zdC9j
b21tb24vc3RtMzJtcF9tdGRwYXJ0cy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCA1ICsrLQogwqBib2FyZC9zdC9jb21tb24vc3RwbWljMS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1
ICsrLQogwqBib2FyZC9zdC9jb21tb24vc3R1c2IxNjB4LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCiDCoGJvYXJkL3N0L3N0
aWg0MTAtYjIyNjAvTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKy0KIMKgYm9hcmQvc3Qvc3RpaDQxMC1iMjI2MC9NYWtlZmlsZcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQogwqBi
b2FyZC9zdC9zdG0zMmY0MjktZXZhbHVhdGlvbi9NQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgIDIgKy0KIMKgYm9hcmQvc3Qvc3RtMzJmNDI5LWV2YWx1YXRpb24vTWFr
ZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCiDCoGJvYXJk
L3N0L3N0bTMyZjQ2OS1kaXNjb3ZlcnkvTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKy0KIMKgYm9hcmQvc3Qvc3RtMzJmNDY5LWRpc2NvdmVyeS9NYWtlZmls
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQogwqBib2FyZC9z
dC9zdG0zMmg3NDMtZGlzY28vTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMiArLQogwqBib2FyZC9zdC9zdG0zMmg3NDMtZGlzY28vTWFrZWZpbGXC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQogwqBi
b2FyZC9zdC9zdG0zMmg3NDMtZXZhbC9NQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KIMKgYm9hcmQvc3Qvc3RtMzJoNzQzLWV2YWwvTWFr
ZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAy
ICstCiDCoGJvYXJkL3N0L3N0bTMybXAxL01BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQogwqBib2FyZC9zdC9zdG0z
Mm1wMS9zdG0zMm1wMS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDIzNCAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiDCoGNvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZ8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICsrCiDCoGNv
bmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCiDCoGRvYy9ib2FyZC9zdC9zdG0zMm1wMS5yc3TCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDIgKy0KIMKgZG9jL2RyaXZlci1tb2RlbC9iaW5kLnJzdMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQogwqBkcml2
ZXJzL2Nsay9jbGtfc3RtMzJmLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM5IAorKysrKysrKystLS0tLS0tLS0tCiDCoGRy
aXZlcnMvY2xrL2Nsa19zdG0zMmg3LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3MCAKKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQogwqBkcml2ZXJzL2Nsay9jbGtfc3RtMzJtcDEuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTQ3IAorKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogwqBkcml2ZXJzL2dwaW8vc3RtMzJfZ3Bpby5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCiDCoGRyaXZlcnMv
aHdzcGlubG9jay9zdG0zMl9od3NwaW5sb2NrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKwogwqBkcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNzQgCisr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogwqBkcml2ZXJzL21haWxib3gvc3Rt
MzItaXBjYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMTYgKysrKy0tLS0KIMKgZHJpdmVycy9tZW1vcnkvc3RtMzItZm1jMi1lYmkuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMwIAorKysr
KysrKy0tLS0tLS0KIMKgZHJpdmVycy9taXNjL3N0bTMyX3JjYy5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArKystLQog
wqBkcml2ZXJzL21tYy9zdG0zMl9zZG1tYzIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4NCAKKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIMKgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9u
YW5kLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNDAgCisrKysrKysrKyst
LS0tLS0tLS0tCiDCoGRyaXZlcnMvcGh5L3BoeS1zdG0zMi11c2JwaHljLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxOCArKysrKy0tLS0KIMKgZHJp
dmVycy9waW5jdHJsL3BpbmN0cmxfc3RtMzIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMwIAorKysrKysrKy0tLS0tLS0KIMKgZHJpdmVycy9wb3dl
ci9yZWd1bGF0b3Ivc3RtMzItdnJlZmJ1Zi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDIgKwogwqBkcml2ZXJzL3JhbS9zdG0zMl9zZHJhbS5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgKysrLS0KIMKg
ZHJpdmVycy9yYW0vc3RtMzJtcDEvc3RtMzJtcDFfZGRyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMzYgCisrKysrKysrKy0tLS0tLS0tLQogwqBkcml2ZXJzL3Jh
bS9zdG0zMm1wMS9zdG0zMm1wMV9pbnRlcmFjdGl2ZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCA0ICstCiDCoGRyaXZlcnMvcmFtL3N0bTMybXAxL3N0bTMybXAxX3JhbS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM4IAorKysrKysrKysrLS0tLS0tLS0t
CiDCoGRyaXZlcnMvcmFtL3N0bTMybXAxL3N0bTMybXAxX3Rlc3RzLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxOSArKysrKystLS0tCiDCoGRyaXZlcnMvcmFtL3N0bTMy
bXAxL3N0bTMybXAxX3R1bmluZy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
MjQgCisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogwqBkcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfY29wcm8uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0KIMKgZHJpdmVycy9yZXNl
dC9zdG0zMi1yZXNldC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxMyArKysrKy0tCiDCoGRyaXZlcnMvcnRjL3N0bTMyX3J0Yy5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMyArKwogwqBkcml2ZXJzL3NlcmlhbC9zZXJpYWxfc3RtMzIuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKysKIMKgZHJp
dmVycy9zcGkvc3RtMzJfcXNwaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0NiAKKysrKysrKysrKysrLS0tLS0tLS0tLS0K
IMKgZHJpdmVycy9zcGkvc3RtMzJfc3BpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzEgCisrKysrKysrLS0tLS0tLQog
wqBkcml2ZXJzL3RpbWVyL3N0bTMyX3RpbWVyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCiDCoGRyaXZlcnMvdmlkZW8vc3Rt
MzIvc3RtMzJfZHNpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxOCArKysrKy0tLS0KIMKgZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzMgCisrKysr
KysrLS0tLS0tLS0KIMKgZHJpdmVycy93YXRjaGRvZy9zdG0zMm1wX3dkdC5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKysrLS0KIMKgNzQg
ZmlsZXMgY2hhbmdlZCwgODQ2IGluc2VydGlvbnMoKyksIDcyMyBkZWxldGlvbnMoLSkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
