Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4582D30D5
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 18:21:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12723C3FADB;
	Tue,  8 Dec 2020 17:21:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76085C3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Dec 2020 17:21:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B8HBiIq021524; Tue, 8 Dec 2020 18:21:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3m4rpmWu8W/YHkJPDqVMp2jN2V7rExAI3oSf6jdZ5cw=;
 b=q58RNjPmI4CKL0IfYoPnMipfM0NKNr2UHhXsd0n+KDB9DwoAHri2L9BCUmKNXjMVYLpt
 wtgWDrGNndnsQe1br6zgxKzCLglf2pMapYhR+Xlia8PUTP1Dm6gDbyof0MHx1phrnL+Y
 XUt3Z6NdSLGRXwLiCH+iNdNl9Ok4fGngC4HcNr5IcesxGmQNiqdO7+gBVPenPzYXQUmR
 J7gC1TnUqiNudwI0Hw3niyC62pn2Xh7CcWw/lXdLaiYWxB0cX3AErH6HU/n8siShGpWg
 sQp8k0NOBPqPp8qChdZIU75cEKLJkDe3s2JgrBTlzJ33XdphAifxg8sszWPkDmKxzOQV 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3583h3t4n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 18:21:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BCA110002A;
 Tue,  8 Dec 2020 18:21:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 926EF22B6FA;
 Tue,  8 Dec 2020 18:21:01 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 18:21:01 +0100
To: <u-boot@lists.denx.de>
References: <20201201102920.84051-1-marex@denx.de>
 <22668d9b2add43d5bb75f50862baf2f6@SFHDAG2NODE3.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <01f3a78a-6cb5-560c-63e6-e0b94629e098@foss.st.com>
Date: Tue, 8 Dec 2020 18:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <22668d9b2add43d5bb75f50862baf2f6@SFHDAG2NODE3.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_14:2020-12-08,
 2020-12-08 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
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

SGkgTWFyZWssCgpGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPiBTZW50OiBtYXJk
aSAxIGTDqWNlbWJyZSAyMDIwIDExOjI5Cj4KPiBUaGUgZGVmYXVsdCBzdGF0ZSBvZiBTRCBidXMg
YW5kIGNsb2NrIGxpbmUgaXMgbG9naWNhbCBISS4gU0QgY2FyZCBJTyBpcyBvcGVuLWRyYWluIGFu
ZCBwdWxscyB0aGUgYnVzIGxpbmVzIExPLiBBbHdheXMgZW5hYmxlIHRoZSBTRCBidXMgcHVsbCB1
cHMgdG8gZ3VhcmFudGVlIHRoaXMgYmVoYXZpb3Igb24gREhDT00gU29NLiBOb3RlIHRoYXQgb24g
U29NcyB3aXRoIFNEIGJ1cyB2b2x0YWdlIGxldmVsIHNoaWZ0ZXIsIHRoZSBwdWxsIHVwcyBhcmUg
YnVpbHQgaW50byB0aGUgbGV2ZWwgc2hpZnRlciwgaG93ZXZlciB0aGF0IGhhcyBubyBuZWdhdGl2
ZSBpbXBhY3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4K
PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgo+IENjOiBQYXRy
aWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJt
L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS5kdHNpIHwgMTQgKysrKysrKysrKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRz
L3N0bTMybXAxNXh4LWRoY29tLmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20u
ZHRzaQo+IGluZGV4IGYwMjJkODM5NWMuLjkwNDkyNDVjNWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9h
cm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLmR0c2kKPiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJt
cDE1eHgtZGhjb20uZHRzaQo+IEBAIC0zMzksNiArMzM5LDIwIEBACj4gICAJc3RhdHVzID0gIm9r
YXkiOwo+ICAgfTsKPiAgIAo+ICsmc2RtbWMxX2I0X3BpbnNfYSB7Cj4gKwkvKgo+ICsJICogU0Qg
YnVzIHB1bGwtdXAgcmVzaXN0b3JzOgo+ICsJICogLSBvcHRpb25hbCBvbiBTb01zIHdpdGggU0Qg
dm9sdGFnZSB0cmFuc2xhdG9yCj4gKwkgKiAtIG1hbmRhdG9yeSBvbiBTb01zIHdpdGhvdXQgU0Qg
dm9sdGFnZSB0cmFuc2xhdG9yCj4gKwkgKi8KPiArCXBpbnMxIHsKPiArCQliaWFzLXB1bGwtdXA7
Cj4gKwl9Owo+ICsJcGluczIgewo+ICsJCWJpYXMtcHVsbC11cDsKPiArCX07Cj4gK307Cj4gKwo+
ICAgJnNkbW1jMiB7Cj4gICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiAgIAlwaW5jdHJs
LTAgPSA8JnNkbW1jMl9iNF9waW5zX2EgJnNkbW1jMl9kNDdfcGluc19hPjsKPiAtLQo+IDIuMjku
Mgo+ClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Mu
c3QuY29tPgoKRm9yIHRoZSBzZXJpZTrCoCB0aGUgdGFyZ2V0IGlzIG5leHQgb3IgaXQgaXMgYSBi
dWdmaXggZm9yIG1hc3RlciAvIHYyMDIxLjAxID8KClRoYW5rcwoKUGF0cmljawoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
