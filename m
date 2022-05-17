Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61A529BED
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 May 2022 10:12:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D958C03FC9;
	Tue, 17 May 2022 08:12:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE511C03FC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 May 2022 08:12:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H6qehO024847;
 Tue, 17 May 2022 10:12:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vQPupJ33EJRMFmslt/AvlsFggZu5KwZgmUKw11AztiY=;
 b=KfAgP1QPZd45EyyWMDfAPDCR9fdpum19vYcLBd+ZD1ZsFHu+aicYszbu5IVPIbWm4DuE
 cBNd1I2rzuFnaUf0MguPkEX7rqLm0RCOQSwvBu7JoLlYt14FQ1Vev2XvfpW2Ej0Lkjjx
 TS4+N4a0uNUYZDqUHXb0CjfTIBxOJG71hgOC78/2CXrYyelYA13lrDSy9e6AgiS0C66l
 +FUxaY8EyahXLs73Q4yhWhf0oLLDgVcjGj8F8ip7rb6SVUDAPoeXBn2Ds4A6sPH010z8
 Xnex1u2Tj/gWGi/CeLFfKXxbjS2kOu9TYagSlt/z7GGjHnYOlRnJjqvHtVlygGMRA3Z+ jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j8rpn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 10:12:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFD1D100034;
 Tue, 17 May 2022 10:12:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CA0F2138F7;
 Tue, 17 May 2022 10:12:49 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 17 May
 2022 10:12:48 +0200
Message-ID: <21688d64-ffeb-d0b7-b6e5-2efeb3f33ec1@foss.st.com>
Date: Tue, 17 May 2022 10:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Sean Anderson <seanga2@gmail.com>, <u-boot@lists.denx.de>
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
 <41b170c1-99ba-18ac-4a94-01c90f67b97c@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <41b170c1-99ba-18ac-4a94-01c90f67b97c@gmail.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/4] stm32mp: add minimal RCC support for
	STM32MP13
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

SGksCgpPbiA1LzExLzIyIDE4OjQ0LCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+IEhpIFBhdHJpY2ss
Cj4KPiBPbiA1LzEwLzIyIDM6NTEgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+Cj4+IEFk
ZCBhIG1pbmltYWwgc3VwcG9ydCBmb3IgU1RNMzJNUDEzIFJDQywgdGhlIHJlc2V0IGFuZCBjbG9j
ayBjb250cm9sbGVyCj4+IC0gdXBkYXRlIG9mIHRoZSBSQ0MgTUlTQyBkcml2ZXIgdG8gYmluZCB0
aGUgY29ycmVjdCBjbG9jayBhbmQgcmVzZXQgCj4+IGRyaXZlcgo+PiAtIHJlc2V0IGRyaXZlciwg
c2FtZSB0aGFuIFNUTTMyTVAxNXggPSBkcml2ZXJzL3Jlc2V0L3N0bTMyLXJlc2V0LmMKPj4gLSBj
bG9jayBkcml2ZXIsIGFkZCBhIGVtcHR5IGRyaXZlciBmb3IgU1RNMzJNUDEzeCA9Cj4+IMKgwqAg
ZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAxMy5jCj4+IC0gQWRkIFJDQyBub2RlIGluIFNP
QyBkZXZpY2UgdHJlZSB3aXRoIHUtYm9vdCxkbS1wcmUtcmVsb2MgcHJvcGVydHkKPj4KPj4gVGhp
cyBzZXJpZSBpcyBvbmx5IGEgcHJlbGltaW5hcnkgc3RlcCBmb3IgU1RNMzJNUDEzIGNsb2NrIGFu
ZCByZXNldCAKPj4gc3VwcG9ydAo+PiBpbiBVLUJvb3QsIGJhc2VkIG9uIExpbnV4IGtlcm5lbCBi
aW5kaW5nIGludHJvZHVjZWQgYnkgWzFdIGFuZCBpdCAKPj4gcHJlcGFyZXMKPj4gdGhlIG5leHQg
ZGV2aWNlIHRyZWUgYWxpZ25tZW50IHdpdGggTGludXgga2VybmVsLgo+Pgo+PiBUaGUgZnVuY3Rp
b25hbCBTVE1QMTMgY2xvY2sgZHJpdmVyIGJhc2VkIG9uIENDRiBhbmQgb24gU0NNSSBjbG9ja3MK
Pj4gcHJvdmlkZWQgYnkgT1AtVEVFIGFuZCB0aGUgY2xvY2sgYW5kIHJlc2V0IHJlZmVyZW5jZXMg
aW4gU09DIGRldmljZSB0cmVlCj4+IHdpbGwgYmUgcHVzaGVkIHdoZW4gdGhlIGFzc29jaWF0ZWQg
cGF0Y2hlcyBpbiBbMV0gd2lsbCBiZSBhY2NlcHRlZC4KPj4KPj4gWzFdIEludHJvZHVjdGlvbiBv
ZiBTVE0zMk1QMTMgUkNDIGRyaXZlciAoUmVzZXQgQ2xvY2sgQ29udHJvbGxlcikKPj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIyMDMxNjEzMTAwMC45ODc0LTEt
Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20vCj4KPiBJJ20gbm90IHJlYWxseSBzdXJlIHdo
YXQgdGhlIHB1cnBvc2Ugb2YgdGhpcyBzZXJpZXMgaXMuIENhbiB5b3UKPiBlbGFib3JhdGUgYSBi
aXQgb24gd2h5IHdlIG5lZWQgYSBkdW1teSBjbG9jayBkcml2ZXI/IFdoeSBkb24ndAo+IHlvdSBq
dXN0IGFkZCB0aGUgYmluZGluZyB0byB0aGUgZGV2aWNlIHRyZWUgd2l0aG91dCB0aGUgYXNzb2Np
YXRlZAo+IGRyaXZlcj8KCgpBZnRlciB0aGlzIHNlcmllLCB0aGUgUkNDIHJlc2V0IHBhcnQgaXMg
ZnVuY3Rpb25hbCBvbiBTVE0zMk1QMTMgKHByb2JlIAphbmQgb3BzKQoKZXZlbiBpZiB0aGUgYXNz
b2NpYXRlZCBiaW5kaW5nIGlzIG5vdCBwcmVzZW50IGluIGRldmljZSB0cmVlLgoKdGVzdGVkIHdp
dGg6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTMxLmR0
c2kgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KaW5kZXggZmNiMGFmMDliNS4uZDljNjE4NWJj
ZiAxMDA2NDQKQEAgLTE5Nyw2ICsxOTcsNyBAQAogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBpbnRl
cnJ1cHQtbmFtZXMgPSAiY21kX2lycSI7CiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIGNsb2NrcyA9
IDwmY2xrX3BsbDRfcD47CiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIGNsb2NrLW5hbWVzID0gImFw
Yl9wY2xrIjsKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIHJlc2V0cyA9IDwmcmNjIDE0MjI0PjsKIMKg
wqDCoMKgIMKgwqDCoCDCoMKgwqAgY2FwLXNkLWhpZ2hzcGVlZDsKIMKgwqDCoMKgIMKgwqDCoCDC
oMKgwqAgY2FwLW1tYy1oaWdoc3BlZWQ7CiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIG1heC1mcmVx
dWVuY3kgPSA8MTMwMDAwMDAwPjsKCgpBIGR1bW15IFNUTTMyTVAxMyBjbG9jayBkcml2ZXIgaXMg
cmVxdWVzdGVkIHRvIGFsbG93IFJDQyBNSVNDIGFuZCBSQ0MgUkVTRVQKCmJpbmRpbmcgYW5kIHBy
b2JlIHdpdGhvdXQgaXNzdWUuCgoKVGhpcyByZXNldCBzdXBwb3J0IHdhcyByZXF1ZXN0ZWQgYnkg
U0RNQ0MgZHJpdmVyIGFuZCBTRC1DYXJkIGJvb3QsIApiZWZvcmUgdGhlIHBhdGNoOgoKaHR0cDov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAyMjA1MDYxNjA1NDAu
MTMuSTM5YjY5ZThkYzdiNDNiOGUyNjVlNzczODhmYjUzZjdjMWZhMmEwMDdAY2hhbmdlaWQvCgoK
QXMgd2Ugc29sdmUgdGhlIFNETUNDIGRlcGVuZGVuY3kgaXNzdWUgKHJlc2V0IGJlY29tZSBvcHRp
b25uYWwpLCBzbyB0aGlzIApzZXJpZSBpcyBubyBtb3JlIG1hbmRhdG9yeS4KCgpUaGlzIHNlcmll
IGlzIGEganVzdCBhIGNsZWFudXAgLyBwcmVsaW1pbmFyeSBzdGVwLCBidXQgSSBjYW4gZHJvcCB0
aGlzIApkdW1teSBSQ0MgZHJpdmVyIGlmIGl0IGlzIGRpc3R1cmJpbmcuCgoKPgo+IC0tU2VhbgoK
ClBhdHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
