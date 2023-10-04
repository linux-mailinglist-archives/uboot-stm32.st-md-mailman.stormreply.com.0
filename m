Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 966787B7E83
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 13:56:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D495C6C831;
	Wed,  4 Oct 2023 11:56:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B636C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 11:56:58 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394ALo4A026794; Wed, 4 Oct 2023 13:56:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=FfuhDUq8QmvdKIFp47kdWb8P2pvA4VHekfhecBJPM+8=; b=a7
 hdGQgpTdDDTSIA+QvaTup/pLUSfDOmfrZmYiShXuzlzGYFaWxDswhm9UQCAM7NXL
 WiaMfiuM1a+KTeav7JFtlK5ikWuhftp7oMIjfNU44BcowGeBFuLbGv7DWTXCLZTr
 Ui2IVye1bAgHcVzAimoYiKEDcnkYaEuY6jsIOOTOLA+t2AbnCIm0UOQHo7ERnN3H
 gWNUkEQQzASV2l5QR49SQK2zaSDWfdC8KxdLJLsBCzHHaFEVfzfbL04UHtdMcMlx
 ig4igHm6NgNUJvBI1Eq1oylVMFE8/4WAk5q8gXsiuCtOx8YR6QrilqXjmqDpt9P0
 uHWtc11t/LOaZFXJZJDw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tew80pge0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 13:56:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0F13100053;
 Wed,  4 Oct 2023 13:56:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D804A235F29;
 Wed,  4 Oct 2023 13:56:55 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 13:56:55 +0200
Message-ID: <55910f71-d7ca-bb3b-1611-10cb53b07da9@foss.st.com>
Date: Wed, 4 Oct 2023 13:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
 <20230926150924.1150082-7-patrice.chotard@foss.st.com>
 <8a5daa34-e50a-2f2d-7ce2-9879e64e881d@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <8a5daa34-e50a-2f2d-7ce2-9879e64e881d@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_04,2023-10-02_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 6/6] board: st: common: cleanup dfu
	support
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

CgpPbiAxMC80LzIzIDExOjU3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjYvMjMgMTc6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4KPj4gc3BsaXQgdGhlIGZp
bGUgc3RtMzJtcF9kZnUuYyBpbiB0d28gZmlsZXMgdG8gc2ltcGxpZnkgdGhlIE1ha2VmaWxlCj4+
IC0gc3RtMzJtcF9kZnUuYzogcmVxdWlyZWQgYnkgQ09ORklHX1NFVF9ERlVfQUxUX0lORk8KPj4g
LSBzdG0zMm1wX2RmdV92aXJ0LmM6IHJlcXVpcmVkIGJ5IENPTkZJR19ERlVfVklSVCBmb3Igc3Rt
MzJwcm9nCj4+IMKgwqAgY29tbWFuZCBvciBWSVJUIGRldmljZSBmb3IgUE1JQyBmb3IgQ09ORklH
X1NFVF9ERlVfQUxUX0lORk8uCj4+Cj4+IFRoaXMgcGF0Y2ggYWxzbyByZW1vdmUgc29tZSByZW1h
aW5pbmcgI2lmZGVmIENPTkZJRwo+PiBhbmQgYXZvaWQgY29tcGlsYXRpb24gZXJyb3Igd2hlbiBD
T05GSUdfU0VUX0RGVV9BTFRfSU5GTyBpcyBub3QKPj4gYWN0aXZhdGVkLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGJvYXJkL3N0L2NvbW1vbi9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgIDEgKwo+PiDCoCBib2FyZC9zdC9jb21tb24vc3RtMzJtcF9kZnUuY8Kg
wqDCoMKgwqAgfCAxMDMgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgYm9hcmQv
c3QvY29tbW9uL3N0bTMybXBfZGZ1X3ZpcnQuYyB8wqAgOTkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKyksIDk5IGRlbGV0
aW9ucygtKQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvc3QvY29tbW9uL3N0bTMybXBf
ZGZ1X3ZpcnQuYwo+Pgo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRy
aWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKPiAKPiAK
QXBwbHkgb24gc3RtMzIvbmV4dAoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
