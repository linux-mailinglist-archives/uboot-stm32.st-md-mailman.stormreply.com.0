Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9E32644F
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 15:46:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2D23C57189;
	Fri, 26 Feb 2021 14:46:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 749F2C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 14:46:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QEVgH5011289; Fri, 26 Feb 2021 15:46:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=e1X37BSgkaAyEiJhSzdQZFWeEToYHADiBAXyigm0IeU=;
 b=xn2Qidv9o/btC7+ml7rGDApEvPfu/mvPvk9i5izLkgbjopG7Ax6OChP+nDqY5yhlNIR4
 mrKz6TLtiRMVhqszo/V0m2UgufuetjOvytn8SXYO+ccjpuXSY8PUnOvzAHU/fy7MvRbD
 gOO/siyYEycGO267vJ/VpTMwPyDxglE331lgjuAx6tW+HHM71ik3fmOD5RyYr92EG/55
 U7Ao/xp9LUmgkQejvi+XYOjWbz0LZit/BOVBM90g/M8vgJbnoDWD9/mBmABef+1lu19X
 MrkKaKuPQOvsWksoYS9NIvD+fS1KDoPzTg1wBn/nhS2A8BphZq7Q2QNvbalDFgDaxOe8 ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66ye5s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 15:46:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7463D100038;
 Fri, 26 Feb 2021 15:46:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63865241602;
 Fri, 26 Feb 2021 15:46:15 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 15:46:14 +0100
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20210226125251.2150584-1-ilias.apalodimas@linaro.org>
 <b60c1a10-ef77-7a20-a70b-8bf1a5b68dfa@foss.st.com>
Message-ID: <16a3077b-8686-0f6f-ed92-3fa17fad9432@foss.st.com>
Date: Fri, 26 Feb 2021 15:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b60c1a10-ef77-7a20-a70b-8bf1a5b68dfa@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp1: enable uefi related
	commands
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

Ck9uIDIvMjYvMjEgMjowOSBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPgo+IE9u
IDIvMjYvMjEgMTo1MiBQTSwgSWxpYXMgQXBhbG9kaW1hcyB3cm90ZToKPj4gVGhlIGJvYXJkIGNh
biBib290IHdpdGggVUVGSS4gV2l0aCB0aGUgbGF0ZXN0IGNoYW5nZXMgaW4gVS1Cb290J3MKPj4g
RUZJIHN1YnN5c3RlbSB3ZSBhbHNvIGhhdmUgc3VwcG9ydCBmb3IgRUZJIHJ1bnRpbWUgdmFyaWFi
bGVzLCB3aXRob3V0Cj4+IFNldFZhcmlhYmxlIHN1cHBvcnQuwqAgV2UgY2FuIGFsc28gc3RvcmUg
dGhlIEVGSSB2YXJpYWJsZXMgaW4gYSBmaWxlIAo+PiBvbiB0aGUKPj4gRVNQIHBhcnRpdGlvbiBh
bmQgcHJlc2VydmUgdGhlbSBhY3Jvc3MgcmVib290cy4KPj4gVGhlIGVudiBhbmQgZWZpZGVidWcg
Y29tbWFuZHMgYXJlIG1pc3NpbmcgaW4gb3JkZXIgdG8gY29uZmlndXJlCj4+IEVGSSB2YXJpYWJs
ZXMgYW5kIHRoZSBlZmlib290bWdyIHRob3VnaC7CoCBTaW5jZSBVLUJvb3QncyBkZWZhdWx0IGNv
bmZpZwo+PiBlbmFibGVzIG90aGVyIEVGSSByZWxhdGVkIGNvbW1hbmRzIChlLmcgYm9vdGVmaSks
IGxldCdzIGFkZCB0aGUgZW52IAo+PiByZWxhdGVkCj4+IGFuZCBlZmlkZWJ1ZyBjb21tYW5kcyBh
bmQgYWxsb3cgdXNlcnMgdG8gZG8gdGhhdAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBJbGlhcyBBcGFs
b2RpbWFzIDxpbGlhcy5hcGFsb2RpbWFzQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiBDaGFuZ2VzIHNp
bmNlIHYxOgo+PiAtIEFwcGx5IGlkZW50aWNhbCBjaGFuZ2VzIG9uIHN0bTMybXAxNV9iYXNpY19k
ZWZjb25maWcKPj4gwqAgY29uZmlncy9zdG0zMm1wMTVfYmFzaWNfZGVmY29uZmlnwqDCoCB8IDMg
KysrCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnIHwgMyArKysKPj4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4KPgo+IFJldmlld2VkLWJ5
OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Cj4gVGhh
bmtzCj4gUGF0cmljawo+Cj4KCkFwcGxpZWQgdG8gdS1ib290LXN0bS9tYXN0ZXIsIHRoYW5rcyEK
ClJlZ2FyZHMKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
