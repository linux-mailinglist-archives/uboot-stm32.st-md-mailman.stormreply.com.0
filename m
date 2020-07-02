Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03788211C8E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:20:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD519C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB9CCC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:19:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627J18c018750; Thu, 2 Jul 2020 09:19:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=j3IdV5i0/2qKA570YC1qrZD2tpUYQtetQ+10+d5kXRU=;
 b=us4VqCofnHEfunNXQ/aXUxKMEpGLUAxW7eGRWfc6uhxTC5KJETHKEuYbcKxItvnTu4M3
 hWlfY20TESo06emupPkcO5XTcHFSCD6pPAmk8t9GQJ3JF617YG3zhkQl+QkjlzsXtWFP
 BhbbwzysxIzc9ljyWvTG1+AUdn9j3GsZ+Q7oIHab3pUGgfcX6qponnJJocPFDVR/F7ZI
 KZQChL6U9NXq3OEyj9m6NI+yrKFyPKBTW20lxhh7jCoq2eYS1fn411XV6YaRs8Vak9JU
 S8+iRoaMw//ZWvw5q6AKSw3vF6CWbXNZ/X/5biTOVuzb0KmS7VCVBRUt12lFqEiyYVKe Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gef4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:19:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F25B10002A;
 Thu,  2 Jul 2020 09:19:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 248A321CA86;
 Thu,  2 Jul 2020 09:19:56 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:19:55 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:19:55 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] stm32mp1: use the command env info -q in
 env_check
Thread-Index: AQHWUEEvmyEzkrLH0EuzKevOwKX59A==
Date: Thu, 2 Jul 2020 07:19:55 +0000
Message-ID: <df76c7e4-22b0-d541-c23c-2781363bd835@st.com>
References: <20200615144201.23220-1-patrick.delaunay@st.com>
In-Reply-To: <20200615144201.23220-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <0A1D13234448DC4CAA42C7E8E5FBC10A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: use the command env info -q in
 env_check
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljaw0KDQoNCk9uIDYvMTUvMjAgNDo0MiBQTSwgUGF0cmljayBEZWxhdW5heSB3cm90
ZToNCj4gQWN0aXZhdGUgdGhlIG5ldyBvcHRpb24gLXEgaW4gY29tbWFuZCAiZW52IGluZm8iDQo+
IHRvIGF2b2lkIHVubmVjZXNzYXJ5IHRyYWNlIGR1cmluZyBib290Lg0KPg0KPiBIaSwNCj4NCj4g
VGhpcyBwYXRjaCB3YXMgcHJldmlvdXMgaW5jbHVkZWQgaW4gVjMgc2VyaWUgMTU4MTA1Lg0KPg0K
PiBUaGlzIHBhdGNoIGhhdmUgZGVwZW5kZW5jeSB3aXRoIHNlcmllIDE4MzQzOCBmb3IgLXEgb3Rw
aW9uDQo+IGFuZCB3aXRoIHNlcmllIDE4MzM4NyBmb3Igc3RtMzJtcDEgZW52X2NoZWNrIHVwZGF0
ZS4NCj4NCj4gRU5EDQpZb3VyIGNvbW1pdCBpcyBtYWxmb3JtZWQuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPg0KPiAtLS0NCj4N
Cj4gIGluY2x1ZGUvY29uZmlncy9zdG0zMm1wMS5oIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2NvbmZpZ3Mvc3RtMzJtcDEuaCBiL2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMS5oDQo+IGluZGV4
IGU5Mjc3ODdiZTAuLjAzOGE2Mzk4NDMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvY29uZmlncy9z
dG0zMm1wMS5oDQo+ICsrKyBiL2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMS5oDQo+IEBAIC0xNTUs
NyArMTU1LDcgQEANCj4gIAkic3BsYXNoaW1hZ2U9MHhjNDMwMDAwMFwwIiAgXA0KPiAgCSJyYW1k
aXNrX2FkZHJfcj0weGM0NDAwMDAwXDAiIFwNCj4gIAkiYWx0Ym9vdGNtZD1ydW4gYm9vdGNtZFww
IiBcDQo+IC0JImVudl9jaGVjaz1pZiBlbnYgaW5mbyAtcCAtZDsgdGhlbiBlbnYgc2F2ZTsgZmlc
MCIgXA0KPiArCSJlbnZfY2hlY2s9aWYgZW52IGluZm8gLXAgLWQgLXE7IHRoZW4gZW52IHNhdmU7
IGZpXDAiIFwNCj4gIAlTVE0zMk1QX0JPT1RDTUQgXA0KPiAgCUJPT1RFTlYgXA0KPiAgCSJib290
X25ldF91c2Jfc3RhcnQ9dHJ1ZVwwIg0KDQpZb3UgY2FuIGFkZCBteSBSZXZpZXdlZC1ieTrCoCB3
aGVuIHRoZSBjb21taXQgbWVzc2FnZSB3aWxsIGJlIGZpeGVkDQoNClRoYW5rcw0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
