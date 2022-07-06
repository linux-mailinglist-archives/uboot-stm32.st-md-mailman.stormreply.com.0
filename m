Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7B568F79
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jul 2022 18:45:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51FA5C03FDB;
	Wed,  6 Jul 2022 16:45:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A405DC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 16:45:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266D9iWV030886;
 Wed, 6 Jul 2022 18:44:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZQgbaD5TZo+kgZmBBBYCKr/mlK1225ci1pLKRWEoNeg=;
 b=EvQkoIZSXTLJgtT4h7oYjdPCSKL0Z+tAOYD7k/F1oV9CkmuA9krTHFGTIsUxNJeDwtC+
 BFVLi+DutwL/Wjv1EoAAM67muZCDeoyWDd1oX4DKIPJ/iya+uz5ybqY8SsCwJhqYW2Pa
 P0HU76WQcIzNGlOopmoEhgiTfibPL3lYRGHcLa5ZlM9MlclpaO1JSR2ctGW6tariz67P
 w9QB+yAzjvhysszDmYBiSoG2j79czi1PK0urgrHooEguiuvZAM/aukcTUQZVyxMrhGFZ
 9rRjq2zQjxEioYmKtOHK4yl1eArZoI2YyeZDNTE9ciGjdgFsU0u7mpU0aUl3H0yuM3uC +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadesa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jul 2022 18:44:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D408910002A;
 Wed,  6 Jul 2022 18:44:51 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AD0721A210;
 Wed,  6 Jul 2022 18:44:50 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.46) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 6 Jul
 2022 18:44:09 +0200
Message-ID: <60c1f004-afad-50f6-9171-e8b88a69ff4d@foss.st.com>
Date: Wed, 6 Jul 2022 18:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Johann Neuhauser <jneuhauser@dh-electronics.com>, <u-boot@lists.denx.de>, 
 Marek Vasut <marex@denx.de>
References: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_09,2022-06-28_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: Drop fastboot and
 stm32prog trigger gpios on DHCOM
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

SGksCgpPbiA2LzMwLzIyIDE2OjE5LCBKb2hhbm4gTmV1aGF1c2VyIHdyb3RlOgo+IFBBMTMgYW5k
IFBBMTQgYXJlIHVzZWQgZm9yIFVTQiBwb3dlciBjb250cm9sIGFuZCBjYW4ndCBiZSB1c2VkCj4g
dG8gZW5mb3JjZSBmYXN0Ym9vdCBvciBzdG0zMnByb2cgbW9kZSBieSBwcmVzc2luZyBhIGJ1dHRv
bi4KPgo+IERlZmluaW5nIENPTkZJR19GQVNUQk9PVC9DT05GSUdfQ01EX1NUTTMyUFJPRyB3aXRo
b3V0IHRoaXMgcGF0Y2ggYXBwbGllZAo+IHJlc3VsdHMgaW4gZmFzdGJvb3Qvc3RtMzJwcm9nIGFs
d2F5cyBzdGFydGluZywgYmVjYXVzZSBQQTEzL1BBMTQgYXJlIGFsd2F5cwo+IGxvdyBkdXJpbmcg
Ym9vdC4gU28gZHJvcCB0aGUgd3JvbmcgdHJpZ2dlciBncGlvcyBkZWZpbml0aW9ucy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEpvaGFubiBOZXVoYXVzZXIgPGpuZXVoYXVzZXJAZGgtZWxlY3Ryb25pY3Mu
Y29tPgo+Cj4gLS0tCj4KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS11LWJvb3Qu
ZHRzaSB8IDIgLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS11LWJvb3QuZHRzaSBiL2FyY2gv
YXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS11LWJvb3QuZHRzaQo+IGluZGV4IGQ3Mzk2N2FjMWI1
ZC4uZWU3NDdhNTJiYjdjIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1k
aGNvbS11LWJvb3QuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS11
LWJvb3QuZHRzaQo+IEBAIC0yNyw4ICsyNyw2IEBACj4gICAJY29uZmlnIHsKPiAgIAkJdS1ib290
LGJvb3QtbGVkID0gImhlYXJ0YmVhdCI7Cj4gICAJCXUtYm9vdCxlcnJvci1sZWQgPSAiZXJyb3Ii
Owo+IC0JCXN0LGZhc3Rib290LWdwaW9zID0gPCZncGlvYSAxMyBHUElPX0FDVElWRV9MT1c+Owo+
IC0JCXN0LHN0bTMycHJvZy1ncGlvcyA9IDwmZ3Bpb2EgMTQgR1BJT19BQ1RJVkVfTE9XPjsKPiAg
IAkJZGgsc29tLWNvZGluZy1ncGlvcyA9IDwmZ3Bpb2YgMTIgMD4sIDwmZ3Bpb2YgMTMgMD4sIDwm
Z3Bpb2YgMTUgMD47Cj4gICAJCWRoLGRkcjMtY29kaW5nLWdwaW9zID0gPCZncGlveiA2IDA+LCA8
JmdwaW96IDcgMD47Cj4gICAJfTsKCgpUaGUgc3VwcG9ydCBvZiB0aGVzZSBidXR0b25zIEdQSU8g
QTEzIGFuZCBBMTQgaGF2ZSBiZSBkb25lIGZvciBTVCBib2FyZHMgCkVWeCBhbmQgREt4OwoKaXQg
aXMgYW4gaW50ZXJuYWwgcmVxdWVzdCBmb3IgQW5kcm9pZCBzdXBwb3J0IG9uIHRvcCBvZiBPcGVu
U1RMaW51eC4KCmFuZCBtYWtlIG5vIHNlbnNlIG9uIERIQ09NIFNUTTMyTVAxNQoKIMKgwqDCoCBV
U0JfUFdSX1NUQVQgVVNCIEhvc3Qgb3ZlciBjdXJyZW50IGluZGljYXRvciAoYWN0aXZlIGxvdykg
MTc0IEkgUEExNCAtCiDCoMKgwqAgVVNCX1BXUl9FTiBVU0IgSG9zdCBwb3dlciBlbmFibGUgc2ln
bmFsIChhY3RpdmUgbG93KSAxNzYgTyBQQTEzIC0KCm1vcmVvdmVyLCBpZiB5b3UgbmV2ZXIgdXNl
IHRoZXNlIHByb3BlcmllcyAic3QsZmFzdGJvb3QtZ3Bpb3MiIGFuZCAKInN0LHN0bTMycHJvZy1n
cGlvcyIgb24gREggYm9hcmRzLAoKeW91IGNhbiBhbHNvIGNsZWFuIHRoZSBjb2RlIGluIGJvYXJk
L2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuYywgCmJvYXJkX2tleV9jaGVjaygpIGNh
biBiZSByZW1vdmVkLgoKPT4gaXQgaXMgY2FsbGVkIGJvYXJkX2luaXQoKQoKClRoaXMgY29kZSB3
YXMgaW5pdGlhbGx5IGNvcGllZCBmcm9tICdib2FyZC9zdC9zdG0zMm1wMS9zdG0zMm1wMS5jJwoK
YnV0IGFmdGVyIHlvdXIgcGF0Y2ggSSB0aGluayBpdCBpcyBub3QgbmVlZGVkLgoKCkFueXdheSBm
b3IgdGhpcyBkZXZpY2UgdHJlZSBwYXRjaAoKClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5
IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2sKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
