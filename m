Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505D7B7E4D
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 13:39:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 055EAC6C831;
	Wed,  4 Oct 2023 11:39:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AB37C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 11:39:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394A4GdM021981; Wed, 4 Oct 2023 13:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=aq1TNJJAyiL2CNSahXVlxuj/w1yMLHCg4l8VFego18E=; b=JI
 oc3oe+aeb7D7+PfxFViMjuawg9ivzkwnxqYQ3tKDCjU2QdwxaUTYOZ34FJSdXFUY
 bpgE4Ma/8FlousMyJ52RBlFI3HvRbTqq7TV5jl4G6H67IPt/CiwxVrAIdXxy6QA5
 HijtvEtBzyxdmENKusNj04AIbD3cjnRDDomNf90q/TRAeZXq0kf88I1kFpW2VMQi
 79iRAs5d1iB2gC3RNc4jdwGoMnvCCsNE/G53MaZVuWVFIE6hCpD8ysAjMpJVIbuX
 uk/Qt0ZSWUgmjBuYiwCYevOQNRXItUTryxNfnJzoxXABzPTCJ/fFLpvfQ2XMTyH5
 xLNyK2S+iMQiJ8Wk/Lfg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3teajd0swe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 13:39:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08320100053;
 Wed,  4 Oct 2023 13:39:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F123D235F0B;
 Wed,  4 Oct 2023 13:39:09 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 13:39:09 +0200
Message-ID: <fc505891-dc25-07e4-2ef8-b9d776a99c9f@foss.st.com>
Date: Wed, 4 Oct 2023 13:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
 <20230926150924.1150082-2-patrice.chotard@foss.st.com>
 <85fc4468-136b-4d26-b249-50f147722377@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <85fc4468-136b-4d26-b249-50f147722377@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_03,2023-10-02_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/6] ARM: dts: stm32mp: alignment with
	v6.6-rc1
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

CgpPbiAxMC80LzIzIDExOjU1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjYvMjMgMTc6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRGV2aWNlIHRyZWUgYWxp
Z25tZW50IHdpdGggTGludXgga2VybmVsIHY2LjYucmMxLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+
IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTMxLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA1MiArLS0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxMzVmLWRrLmR0
c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDY4ICsrLS0KPj4gwqAgYXJjaC9hcm0v
ZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM2NCArKysr
KysrKysrKysrKysrKy0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNS1zY21pLmR0c2nCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA3ICstCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0z
Mm1wMTUxLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzNCArLQo+
PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1Ny5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMTUgKy0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWRrMS1z
Y21pLmR0c8KgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArLQo+PiDCoCAuLi4xNTdhLW1pY3JvZ2Vh
LXN0bTMybXAxLW1pY3JvZGV2Mi4wLW9mNy5kdHMgfMKgwqAgMyArCj4+IMKgIGFyY2gvYXJtL2R0
cy9zdG0zMm1wMTU3Yy1kazItc2NtaS5kdHPCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKy0KPj4g
wqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWRrMi5kdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMzAgKy0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWVkMS1zY21pLmR0
c8KgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArLQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1
N2MtZWQxLmR0c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyNCArLQo+PiDCoCBhcmNo
L2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXNjbWkuZHRzwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA3
ICstCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDM0ICstCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1ka3gu
ZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNDIgKy0KPj4gwqAgaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9zdG0zMm1wMS1jbGtzLmjCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEzLWNsa3MuaMKgwqDCoCB8wqDCoCAyICst
Cj4+IMKgIC4uLi9yZWd1bGF0b3Ivc3Qsc3RtMzJtcDEzLXJlZ3VsYXRvci5owqDCoMKgwqDCoMKg
wqAgfMKgIDQyICsrCj4+IMKgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvc3RtMzJtcDEtcmVz
ZXRzLmjCoMKgIHzCoMKgIDIgKy0KPj4gwqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zdG0z
Mm1wMTMtcmVzZXRzLmjCoCB8wqDCoCAyICstCj4+IMKgIDIwIGZpbGVzIGNoYW5nZWQsIDU4NSBp
bnNlcnRpb25zKCspLCAxNjYgZGVsZXRpb25zKC0pCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL2R0LWJpbmRpbmdzL3JlZ3VsYXRvci9zdCxzdG0zMm1wMTMtcmVndWxhdG9yLmgKPj4K
PiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBm
b3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCj4gCgpBcHBseSBvbiBzdG0z
Mi9uZXh0CgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
