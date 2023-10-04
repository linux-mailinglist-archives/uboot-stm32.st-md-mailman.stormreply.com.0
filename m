Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 605917B7E54
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 13:39:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 291A7C6C831;
	Wed,  4 Oct 2023 11:39:40 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D38AC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 11:39:39 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394A38FZ022388; Wed, 4 Oct 2023 13:39:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=1bjYv1+qVN48CPkXw+G6lEYUvQYM46eB6hTjeD9zBmA=; b=Td
 SFSwurktfRslAiwx9x+mrpMUhtug9YIisQ3Q2riOkHYkAQP9s65ueq8L0J6uGVQF
 uddVRN2TAf9zjgWAim/IjV4Xo/ANIBytluPBlytdVDAnhTShsRrLzP16WygJsbJY
 KvtuX4ytwfEe5fYXzgYiLvkgtjAFDj1NK2eRxmFrOhufy927N10y4eLZseA012mn
 0bSJ4YOBHCcRMiERtLiTkLuy94dNfWk+AkQXozGb/5WlXVaDhsK2UHoCsZabqeCJ
 H2FljNf0AbeKB10ex/yiGDI5Nzsl/ImbAj25+ReSmRmoYADgm60MRbXhMGWero0e
 ztTPfu1iT5+AHkDjrfrw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3texmj6h1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 13:39:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33F81100053;
 Wed,  4 Oct 2023 13:39:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C77B235F10;
 Wed,  4 Oct 2023 13:39:38 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 13:39:37 +0200
Message-ID: <e08165c0-6426-2e6c-e086-9250eba2398d@foss.st.com>
Date: Wed, 4 Oct 2023 13:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
 <20230926150924.1150082-5-patrice.chotard@foss.st.com>
 <9767555c-ae04-35f7-fdae-f84f2750c4f0@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <9767555c-ae04-35f7-fdae-f84f2750c4f0@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_03,2023-10-02_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 4/6] configs: stm32mp13: activate
	command stm32prog
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

CgpPbiAxMC80LzIzIDExOjU2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjYvMjMgMTc6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4KPj4gQWN0aXZhdGUgdGhl
IGNvbW1hbmQgc3RtMzJwcm9nIHdpdGggQ09ORklHX0NNRF9TVE0zMk1QUk9HLgo+PiBUaGUgQ09O
RklHX1NFVF9ERlVfQUxUX0lORk8gaXMgYWxzbyBhY3RpdmF0ZWQgdG8gc3VwcG9ydAo+PiB0aGUg
cmVxdWlyZWQgd2VhayBmdW5jdGlvbnMgZm9yIHRoZSBERlUgdmlydHVhbCBiYWNrZW4gZGVmaW5l
ZCBpbgo+PiBib2FyZC9zdC9jb21tb24vc3RtMzJtcF9kZnUuYy4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+
Cj4+IC0tLQo+Pgo+PiDCoCBjb25maWdzL3N0bTMybXAxM19kZWZjb25maWfCoMKgwqDCoMKgwqDC
oCB8IDIgKysKPj4gwqAgaW5jbHVkZS9jb25maWdzL3N0bTMybXAxM19jb21tb24uaCB8IDQgKysr
Kwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pgo+IAo+IAo+IFJldmll
d2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+
IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKPiAKPiAKPiAKQXBwbHkgb24gc3RtMzIvbmV4dAoKVGhh
bmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
