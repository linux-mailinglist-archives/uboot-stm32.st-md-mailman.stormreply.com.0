Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C33D71D4
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Jul 2021 11:22:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5906BC597AB;
	Tue, 27 Jul 2021 09:22:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D0EBC5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 09:22:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R9CPpg027114; Tue, 27 Jul 2021 11:22:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=pToMvoo4W50oOaH1u7qrA8rWa2aeT6+jIhO4hArYxjs=;
 b=NewGG3OAT+oTVLT2QTNAAG+7bSXyxcvxsfgNqKOD2xSCnnnNFMV+5bhrG+BPiFJMbCxK
 zVpJ/9Q125MRT7+y9GdENvbtJrEQfuLGXCeRoMXfharYplSh1K+R8ioFUnM2a2kUC+DG
 TP4NSlzNMS03G9bNQ3zib683Kq6yqzONhiTChMLOZbP0CnvKCJ6TYhV7qcFtFN2Ee+ab
 SNWDI+xD5RYfLUW7+oFN+kxKKdBP4yNqMWqITDbPWJP6qG73+HDBQJv/s5pNug+3x7P0
 ce2z2wNbcGngCI52N8YBkhKEqB42hMtoVSXy/y0VhNYrJ9sjjxY/aS8TSBLm5RCRNPNc sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a2cp3h1vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 11:22:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E856610002A;
 Tue, 27 Jul 2021 11:22:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBEF921BF75;
 Tue, 27 Jul 2021 11:22:32 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 11:22:32 +0200
To: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <66d4e139-567f-c219-0f54-46ab5487d419@foss.st.com>
Date: Tue, 27 Jul 2021 11:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.10 =
 u-boot-stm32-20210727
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

SGkgVG9tLAoKUGxlYXNlIHB1bGwgdGhlIFNUTTMyIHJlbGF0ZWQgcGF0Y2hlcyBmb3IgdS1ib290
L21hc3RlciwgdjIwMjEuMTA6IAp1LWJvb3Qtc3RtMzItMjAyMTA3MjcKCi0gRklQIEVuYWJsZSBP
UC1URUUgYW5kIFRaQyBzdXBwb3J0IGluIFNQTCBmb3IgU1RNMzJNUDE1IFNvQwotIEFkZCBzdG0z
Mm1wMTUgbWlzc2luZyBTUEkgY2xvY2sgc3VwcG9ydAotIE1hbmFnZSBwdWxsLXVwIG9uIGdwaW8g
YnV0dG9uIFNUTTMyTVAxNSBib2FyZHMKLSBDb3JyZWN0IFNUTTMyTVAxNSBib290IHdoZW4gVEFN
UEVSIHJlZ2lzdGVycyBhcmUgaW52YWxpZAotIEZpeCBFTU1DIHBpbm11eCBvbiBTVE0zMk1QMTUg
QXZlbmdlcjk2IGJvYXJkCgpDSSBzdGF0dXM6IApodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9v
dC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0vLS9waXBlbGluZXMvODQzNAoKVGhhbmtzLApQYXRyaWNr
CgpnaXQgcmVxdWVzdC1wdWxsIG9yaWdpbi9tYXN0ZXIgCmh0dHBzOi8vc291cmNlLmRlbnguZGUv
dS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS5naXQvIAp1LWJvb3Qtc3RtMzItMjAyMTA3MjcK
CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGI3MGI5YjA3NDYzZGIyZjY5Mzdj
N2VhNmQ3ZmI1MTIyZmViN2JhMWI6CgogwqAgUHJlcGFyZSB2MjAyMS4xMC1yYzEgKDIwMjEtMDct
MjYgMjA6NTc6MTggLTA0MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiDCoCBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1z
dG0uZ2l0LyAKdGFncy91LWJvb3Qtc3RtMzItMjAyMTA3MjcKCmZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byA2NWIzZjU2ZDQyZTVkZGM5MTgzODQzNzIzY2Y3MzU5NTBmMDYyNDEwOgoKIMKg
IEFSTTogZHRzOiBzdG0zMm1wOiBBZGQgT1AtVEVFIHJlc2VydmVkIG1lbW9yeSB0byBTUEwgZHRi
ICgyMDIxLTA3LTI3IAowOTo0ODoxMSArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSBGSVAgRW5hYmxlIE9QLVRF
RSBhbmQgVFpDIHN1cHBvcnQgaW4gU1BMIGZvciBTVE0zMk1QMTUgU29DCi0gQWRkIHN0bTMybXAx
NSBtaXNzaW5nIFNQSSBjbG9jayBzdXBwb3J0Ci0gTWFuYWdlIHB1bGwtdXAgb24gZ3BpbyBidXR0
b24gU1RNMzJNUDE1IGJvYXJkcwotIENvcnJlY3QgU1RNMzJNUDE1IGJvb3Qgd2hlbiBUQU1QRVIg
cmVnaXN0ZXJzIGFyZSBpbnZhbGlkCi0gRml4IEVNTUMgcGlubXV4IG9uIFNUTTMyTVAxNSBBdmVu
Z2VyOTYgYm9hcmQKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleGFuZHJ1IEdhZ25pdWMgKDUpOgogwqDCoMKgwqDCoCBz
cGw6IG1tYzogU3VwcG9ydCBPUC1URUUgcGF5bG9hZHMgaW4gRmFsY29uIG1vZGUKIMKgwqDCoMKg
wqAgc3BsOiBJbnRyb2R1Y2Ugc3BsX2JvYXJkX3ByZXBhcmVfZm9yX29wdGVlKCkgaG9vawogwqDC
oMKgwqDCoCBhcm06IHN0bTMybXA6IEltcGxlbWVudCBzdXBwb3J0IGZvciBUWkMgNDAwIGNvbnRy
b2xsZXIKIMKgwqDCoMKgwqAgc3RtMzJtcDE6IHNwbDogQ29uZmlndXJlIFRydXN0Wm9uZSBjb250
cm9sbGVyIGZvciBPUC1URUUKIMKgwqDCoMKgwqAgQVJNOiBkdHM6IHN0bTMybXA6IEFkZCBPUC1U
RUUgcmVzZXJ2ZWQgbWVtb3J5IHRvIFNQTCBkdGIKCk1hcmVrIFZhc3V0ICgxKToKIMKgwqDCoMKg
wqAgQVJNOiBkdHM6IHN0bTMyOiBGaXggQVY5NiBlTU1DIHBpbm11eAoKUGF0cmljayBEZWxhdW5h
eSAoMyk6CiDCoMKgwqDCoMKgIGFybTogc3RtMzJtcDE6IGZvcmNlIGJvb3RfZGV2aWNlIHZhcmlh
YmxlIGZvciBpbnZhbGlkIFRBTVAgCnJlZ2lzdGVyIHZhbHVlCiDCoMKgwqDCoMKgIHN0bTMybXAx
OiBhZGQgcHVsbC11cCBmb3IgZ3BpbyBidXR0b24gUEExMyBhbmQgUEExNAogwqDCoMKgwqDCoCBj
bGs6IHN0bTMybXAxOiBhZGQgc3VwcG9ydCBvZiBtaXNzaW5nIFNQSSBjbG9ja3MKCiDCoGFyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3YS1kazEtdS1ib290LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgNyArKy0tCiDCoGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1lZDEtdS1ib290LmR0
c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLS0KIMKgYXJjaC9hcm0vZHRzL3N0
bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni11LWJvb3QuZHRzaSB8wqDCoCAyICstCiDCoGFyY2gv
YXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCAyICstCiDCoGFyY2gvYXJtL21hY2gtc3RtMzJtcC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwogwqBhcmNoL2FybS9tYWNo
LXN0bTMybXAvY3B1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCA0ICsrLQogwqBhcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNo
L3R6Yy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzMyAKKysrKysrKysrKysrKysrKysr
CiDCoGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5MiAKKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3R6YzQw
MC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMzYgCisr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiDCoGJvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArKwogwqBjb21t
b24vc3BsL3NwbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDUgKysrCiDCoGNvbW1vbi9zcGwvc3Bs
X21tYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstLQogwqBkcml2ZXJzL2Nsay9jbGtfc3RtMzJtcDEuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEz
ICsrKysrKysKIMKgaW5jbHVkZS9zcGwuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTQgKysr
KysrKysKIMKgMTQgZmlsZXMgY2hhbmdlZCwgMzEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9t
YWNoL3R6Yy5oCiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9tYWNoLXN0bTMybXAvdHpj
NDAwLmMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
