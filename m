Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDD97E7C83
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:23:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61AB8C6C837;
	Fri, 10 Nov 2023 13:23:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53547C6B47F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:23:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAAkwMi030956; Fri, 10 Nov 2023 14:23:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=uJaz6nnf2Gn6y7t2bs1U95vkcv3zbnKLEbx5I0FsBYw=; b=uQ
 mjZdY8M6RQ/8MSSJ0dE2oblpbYqZY9WTTqlN5+t0PIeqHpW/hYFqxotSqwtYeQzP
 2bXuYZCCJfYJvYViAuBLQht3bITy9yn6JsjotBBGicYHh5vxwW9k6k8NjLbjE/HA
 9uPFeyS6IFr4CwsFMe2HV+KM5NBDJNMwx7XHqUeicjPpfPEffFmS7I1iiXWsgCx4
 cxkYzdL+u+oaNUY/Sm3zTh3ZYSG6j9YQLg+P5vn6/T0+oHyLwOuNC8I8kGFfOJK3
 sDr8Ll1h62l/TOH0NfbYmTJOXzW6iWV6MJsmIQdVoGb9whnuLun748U2FO254bCc
 RGa1MEjxvWHkWzw2xSlA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w26p8xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:23:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE27B10005F;
 Fri, 10 Nov 2023 14:23:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A72BE237D69;
 Fri, 10 Nov 2023 14:23:52 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:23:52 +0100
Message-ID: <f9809114-aad1-430b-8d56-460dc5bdf207@foss.st.com>
Date: Fri, 10 Nov 2023 14:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-8-patrice.chotard@foss.st.com>
 <309f81b6-a9fc-4c80-937c-4874dff84ab6@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <309f81b6-a9fc-4c80-937c-4874dff84ab6@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 7/9] pinctrl: pinctrl_stm32: Add
	stm32mp2 support
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

CgpPbiAxMS85LzIzIDEwOjE2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQzLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEFkZCBzdG0zMm1wMiBj
b21wYXRpYmxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvcGluY3RybC9waW5j
dHJsX3N0bTMyLmMgfCAyICsrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsX3N0bTMyLmMgYi9kcml2
ZXJzL3BpbmN0cmwvcGluY3RybF9zdG0zMi5jCj4+IGluZGV4IDhiYjc1ODg3MTRhLi43MTIwYjhl
ZGJhMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmxfc3RtMzIuYwo+PiAr
KysgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybF9zdG0zMi5jCj4+IEBAIC01MDUsNiArNTA1LDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1ZGV2aWNlX2lkIHN0bTMyX3BpbmN0cmxfaWRzW10gPSB7
Cj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTU3LXBpbmN0cmwiIH0s
Cj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTU3LXotcGluY3RybCIg
fSwKPj4gwqDCoMKgwqDCoCB7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAxMzUtcGluY3RybCIg
fSwKPj4gK8KgwqDCoCB7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAyNTctcGluY3RybCIgfSwK
Pj4gK8KgwqDCoCB7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAyNTctei1waW5jdHJsIiB9LAo+
PiDCoMKgwqDCoMKgIHsgfQo+PiDCoCB9Owo+PiDCoCAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0
cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MK
PiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL25leHQKClRoYW5rcwpQYXRyaWNl
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
