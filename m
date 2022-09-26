Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6975EA687
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 14:53:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 363F3C0D2BB;
	Mon, 26 Sep 2022 12:53:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFF7AC035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 12:53:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QASTFv014605;
 Mon, 26 Sep 2022 14:53:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xLO3yR9+jbnhjEgWoXxLaNFLAFWdDv2hu1JfrMG8Yvs=;
 b=BSOpjY/kbftvrfscXRi2ZpTV7pc/kkZow7W3E3BPtWYjXB1jFOpMnmC64AM6x35F8qE1
 Av/gX2r04DeoLZAUFcWemz3cbAeVa4KkUlRLJs7FmgjN57VbAXHGJi8wvIhbsQdVnGIU
 AqDVRWVg5TdIv3Jif+74UUnyPX1aiA7ldYwLpAi2QesFQ6Uje4AmDiXyuMlRrWnWDzEy
 /1jQNtQNga1TPJ7WihqkE3zW424JgcBGYp/4P1DOjv1ZFnjD1Ev9TD3/awYskKbp9z3m
 /E21VZ7accJlboF8v+QRQpOUmd2qO/gAa92prepoNBEUb2yBpapAz988dvx8eky83zOF vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1auxst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:53:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C09CC10002A;
 Mon, 26 Sep 2022 14:53:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BAA9622A6D5;
 Mon, 26 Sep 2022 14:53:02 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.46) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 14:53:01 +0200
Message-ID: <0ae7d275-a876-e012-9296-c2461dbbb95b@foss.st.com>
Date: Mon, 26 Sep 2022 14:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220923112033.2458836-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220923112033.2458836-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: DT sync with kernel
 v6.0-rc4 for MCU's boards
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

SGksCgpPbiA5LzIzLzIyIDEzOjIwLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gRGV2aWNlIHRy
ZWUgYWxpZ25tZW50IHdpdGgga2VybmVsIHY2LjAtcmM0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAgIGFy
Y2gvYXJtL2R0cy9zdG0zMjQyOWktZXZhbC11LWJvb3QuZHRzaSAgfCAgMiArLQo+ICAgYXJjaC9h
cm0vZHRzL3N0bTMyNzQ2Zy1ldmFsLmR0cyAgICAgICAgICB8IDE4ICsrKystCj4gICBhcmNoL2Fy
bS9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gvYXJtL2R0
cy9zdG0zMmY0MjktZGlzY28tdS1ib290LmR0c2kgfCAgNCArLQo+ICAgYXJjaC9hcm0vZHRzL3N0
bTMyZjQyOS1kaXNjby5kdHMgICAgICAgICB8IDIwICsrKy0tCj4gICBhcmNoL2FybS9kdHMvc3Rt
MzJmNDI5LXBpbmN0cmwuZHRzaSAgICAgIHwgOTQgKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAg
IGFyY2gvYXJtL2R0cy9zdG0zMmY0MjkuZHRzaSAgICAgICAgICAgICAgfCA2OSArKystLS0tLS0t
LS0tLS0tLQo+ICAgYXJjaC9hcm0vZHRzL3N0bTMyZjQ2OS1kaXNjby11LWJvb3QuZHRzaSB8ICA0
ICstCj4gICBhcmNoL2FybS9kdHMvc3RtMzJmNDY5LWRpc2NvLmR0cyAgICAgICAgIHwgMjQgKysr
Ky0tCj4gICBhcmNoL2FybS9kdHMvc3RtMzJmNDY5LXBpbmN0cmwuZHRzaSAgICAgIHwgOTYgKysr
KysrKysrKysrLS0tLS0tLS0tLS0tCj4gICBhcmNoL2FybS9kdHMvc3RtMzJmNy1waW5jdHJsLmR0
c2kgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMmY3LXUtYm9vdC5kdHNpICAg
ICAgICAgfCAgMiArLQo+ICAgYXJjaC9hcm0vZHRzL3N0bTMyZjc0Ni1kaXNjby5kdHMgICAgICAg
ICB8IDEyICsrKwo+ICAgYXJjaC9hcm0vZHRzL3N0bTMyZjc0Ni5kdHNpICAgICAgICAgICAgICB8
IDY3ICstLS0tLS0tLS0tLS0tLS0tCj4gICBhcmNoL2FybS9kdHMvc3RtMzJmNzY5LWRpc2NvLmR0
cyAgICAgICAgIHwgMTggKysrKy0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMmg3NDMuZHRzaSAgICAg
ICAgICAgICAgfCAxOSArKy0tLQo+ICAgYXJjaC9hcm0vZHRzL3N0bTMyaDc0M2ktZGlzY28uZHRz
ICAgICAgICB8ICA4ICstCj4gICBhcmNoL2FybS9kdHMvc3RtMzJoNzQzaS1ldmFsLmR0cyAgICAg
ICAgIHwgIDggKy0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMmg3NTBpLWFydC1waS5kdHMgICAgICAg
fCAgOCArLQo+ICAgMTkgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMoKyksIDI3MCBkZWxl
dGlvbnMoLSkKCi4uLi4uCgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMyZjQyOS1k
aXNjby11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMmY0MjktZGlzY28tdS1ib290LmR0
c2kKPiBpbmRleCBjOTkzZjg2YmU4Li5kY2M2OGM0YmNjIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJt
L2R0cy9zdG0zMmY0MjktZGlzY28tdS1ib290LmR0c2kKPiArKysgYi9hcmNoL2FybS9kdHMvc3Rt
MzJmNDI5LWRpc2NvLXUtYm9vdC5kdHNpCj4gQEAgLTI3LDcgKzI3LDcgQEAKPiAgIAo+ICAgCXNv
YyB7Cj4gICAJCXUtYm9vdCxkbS1wcmUtcmVsb2M7Cj4gLQkJcGluLWNvbnRyb2xsZXIgewo+ICsJ
CXBpbmN0cmxANDAwMjAwMDAgewo+ICAgCQkJdS1ib290LGRtLXByZS1yZWxvYzsKPiAgIAkJfTsK
PiAgIAoKTklUOsKgIGNhbiBiZSBzaW1wbHkgYnkgdXNpbmcgYWxpYXMKCiZwaW5jdHJsIHsKCXUt
Ym9vdCxkbS1wcmUtcmVsb2M7Cn07CgoKCj4gQEAgLTE5Myw2ICsxOTMsNiBAQAo+ICAgCXUtYm9v
dCxkbS1wcmUtcmVsb2M7Cj4gICB9Owo+ICAgCj4gLSZ0aW1lcjUgewo+ICsmdGltZXJzNSB7Cj4g
ICAJdS1ib290LGRtLXByZS1yZWxvYzsKPiAgIH07CgoKLi4uCgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vZHRzL3N0bTMyZjQ2OS1kaXNjby11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0z
MmY0NjktZGlzY28tdS1ib290LmR0c2kKPiBpbmRleCBjZDE3MzYyM2VmLi43ZjAxMmI0OWYwIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMmY0NjktZGlzY28tdS1ib290LmR0c2kKPiAr
KysgYi9hcmNoL2FybS9kdHMvc3RtMzJmNDY5LWRpc2NvLXUtYm9vdC5kdHNpCj4gQEAgLTI4LDcg
KzI4LDcgQEAKPiAgIAo+ICAgCXNvYyB7Cj4gICAJCXUtYm9vdCxkbS1wcmUtcmVsb2M7Cj4gLQkJ
cGluLWNvbnRyb2xsZXIgewo+ICsJCXBpbmN0cmxANDAwMjAwMDAgewo+ICAgCQkJdS1ib290LGRt
LXByZS1yZWxvYzsKPiAgIAkJfTsKCk5JVDrCoCBjYW4gYmUgc2ltcGx5IGJ5IHVzaW5nIGFsaWFz
CgomcGluY3RybCB7Cgl1LWJvb3QsZG0tcHJlLXJlbG9jOwp9OwoKCj4gICAKPiBAQCAtMjU2LDYg
KzI1Niw2IEBACj4gICAJdS1ib290LGRtLXByZS1yZWxvYzsKPiAgIH07Cj4gICAKPiAtJnRpbWVy
NSB7Cj4gKyZ0aW1lcnM1IHsKPiAgIAl1LWJvb3QsZG0tcHJlLXJlbG9jOwo+ICAgfTsKCi4uLgoK
CjIgTklUUwoKClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
